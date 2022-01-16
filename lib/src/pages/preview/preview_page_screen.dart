import 'package:flutter/material.dart';
import 'package:manga_project/src/pages/preview/hor_divider.dart';
import 'package:manga_project/src/pages/preview/preview_manga_chapter_list.dart';
import 'package:manga_project/src/pages/preview/preview_manga_desc.dart';
import 'package:manga_project/src/pages/preview/preview_manga_page.dart';
import 'package:web_scraper/web_scraper.dart';

class PreviewPageScreen extends StatefulWidget {
  final String mangaLink;

  const PreviewPageScreen({Key key, this.mangaLink}) : super(key: key);

  @override
  _PreviewPageStateScreen createState() => _PreviewPageStateScreen();
}

class _PreviewPageStateScreen extends State<PreviewPageScreen> {
  String mangaTitle, mangaGenres, mangaStatus, mangaAuthor, mangaDesc, mangaImg;

  List<Map<String, dynamic>> mangaDetail;
  List<Map<String, dynamic>> mangaDescList;
  List<Map<String, dynamic>> mangaChapters;
  List<Map<String, dynamic>> mangaTitleBar;
  List<Map<String, dynamic>> mangaImgCover;

  bool dataFetch = false;

  void getMangaInfos() async {
    String tempBaseUrl = widget.mangaLink.split(".com")[0] + ".com";
    String tempRoute = widget.mangaLink.split(".com")[1];
    final webscraper = WebScraper(tempBaseUrl);

    if (await webscraper.loadWebPage(tempRoute)) {
      mangaDetail = webscraper.getElement(
        'div.panel-story-info > div.story-info-right > table > tbody > tr > td.table-value',
        [],
      );

      mangaDescList = webscraper.getElement(
        'div.panel-story-info > div.panel-story-info-description',
        [],
      );

      mangaChapters = webscraper.getElement(
        'div.panel-story-chapter-list > ul > li > a',
        ['href'],
      );

      mangaTitleBar = webscraper.getElement(
        'div.panel-story-info > div.story-info-right > h1',
        [],
      );

      mangaImgCover = webscraper.getElement(
        'div.panel-story-info > div.story-info-left > span > img',
        ['src'],
      );
    }
    mangaGenres = mangaDetail[3]['title'].toString().trim();
    mangaStatus = mangaDetail[2]['title'].toString().trim();
    mangaAuthor = mangaDetail[1]['title'].toString().trim();
    mangaDesc = mangaDescList[0]['title'].toString().trim();
    mangaTitle = mangaTitleBar[0]['title'].toString().trim();
    mangaImg = mangaImgCover[0]['title'].toString().trim();

    print(mangaImgCover);

    setState(() {
      dataFetch = true;
    });
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
          title: Text(mangaTitle),
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
                          mangaImg: mangaImgCover[0]['attributes']['src'],
                          mangaStatus: mangaStatus,
                          mangaAuthor: mangaAuthor),
                      HorDivider(),
                      MangaDesc(
                        mangaDesc: mangaDesc,
                        mangaGenres: mangaGenres,
                      ),
                      HorDivider(),
                      MangaChapters(
                        mangaChapters: mangaChapters,
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
