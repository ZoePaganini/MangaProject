import 'package:flutter/material.dart';
import 'package:manga_project/src/pages/homepage/main_page.dart';
import 'package:manga_project/src/pages/preview/preview_manga_chapter_list.dart';
import 'package:manga_project/src/pages/preview/preview_manga_desc.dart';
import 'package:manga_project/src/pages/preview/preview_manga_info.dart';
import 'package:manga_project/src/widgets/hor_divider.dart';
import 'package:web_scraper/web_scraper.dart';

class PreviewPageScreen extends StatefulWidget {
  final String mangaImg, mangaTitle, mangaLink;
  final bool fromReader;
  const PreviewPageScreen(
      {Key key, this.mangaImg, this.mangaTitle, this.mangaLink, this.fromReader})
      : super(key: key);

  @override
  _PreviewPageStateScreen createState() => _PreviewPageStateScreen();
}

class _PreviewPageStateScreen extends State<PreviewPageScreen> {
  String mangaGenres, mangaYear, mangaDesc, mangaType;

  List<Map<String, dynamic>> mangaDetail;
  List<Map<String, dynamic>> mangaDescList;
  List<Map<String, dynamic>> mangaChapters;
  List<Map<String, dynamic>> mangaTypeList;

  bool dataFetch = false;

  void getMangaInfos() async {
    String tempBaseUrl = widget.mangaLink.split(".com")[0] + ".com";
    String tempRoute = widget.mangaLink.split(".com")[1];

    final webscraper = WebScraper(tempBaseUrl);

    if (await webscraper.loadWebPage(tempRoute)) {
      mangaDetail = webscraper.getElement(
          'div.post-content-data > div.post-content_item > div.summary-content',
          []);

      mangaDescList = webscraper.getElement(
        'div.summary__content.show-more',
        [],
      );

      mangaChapters = webscraper.getElement(
        'body > div.wrap > div > div > div > div.c-page-content.style-1 > div > div > div.row > div.main-col.col-lg-8.col-md-12.col-sm-12 > div > div.c-page > div > div.page-content-listing.single-page.list-manga-check > div > ul > li > ul > li > a',
        ['href'],
      );

      mangaTypeList = webscraper.getElement(
        'body > div.wrap > div > div > div > div.profile-manga > div > div > div > div.post-title > span',
        [],
      );

      setState(() {
        dataFetch = true;
      });
    }

    mangaYear = mangaDetail[0]['title'];
    mangaGenres = mangaDetail[1]['title'].toString().trim();
    mangaType = mangaTypeList[0]['title'];
    mangaDesc = mangaDescList[0]['title'];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMangaInfos();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              if ((widget.fromReader == false)) {
                Navigator.pop(context);       
              } else {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => HomePageNavigator())  
                );
              }
            },
            icon: Icon(Icons.arrow_back)),
            title: Text(widget.mangaTitle),
            centerTitle: true,
            backgroundColor: Colors.black,
        ),
        body: dataFetch
            ? Container(
                height: screenSize.height,
                width: screenSize.width,
                color: Colors.black,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PreviewMangaPage(
                        mangaImg: widget.mangaImg,
                        mangaYear: mangaYear,
                        mangaType: mangaType,
                        mangaChapters: mangaChapters,
                        mangaTitle: widget.mangaTitle,
                        mangaLink: widget.mangaLink,
                      ),
                      HorDivider(height: 5,),
                      MangaDesc(
                        mangaDesc: mangaDesc,
                        mangaGenres: mangaGenres,
                      ),
                      HorDivider(height: 5,),
                      GestureDetector(
                        child: MangaChapters(
                          mangaChapters: mangaChapters,
                          mangaImg: widget.mangaImg,
                          mangaLink: widget.mangaLink,
                          mangaTitle: widget.mangaTitle,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
