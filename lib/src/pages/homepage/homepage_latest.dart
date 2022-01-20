import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manga_project/src/constants/constants.dart';
import 'package:manga_project/src/pages/viewer/viewer_manga_page.dart';
import 'package:manga_project/src/widgets/chapter_card.dart';
import 'package:web_scraper/web_scraper.dart';

class LatestChapters extends StatefulWidget {
  const LatestChapters({Key key}) : super(key: key);

  @override
  _LatestChapters createState() => _LatestChapters();
}

class _LatestChapters extends State<LatestChapters> {
  bool mangaLoaded = false;
  List<Map<String, dynamic>> mangaList;
  List<Map<String, dynamic>> mangaUrlList;
  List<Map<String, dynamic>> mangaChapterList;


  void fetchManga() async {
    final webscraper = WebScraper(Constants.mangaUrl);

    if (await webscraper.loadWebPage('/')) {
      mangaList = webscraper.getElement(
        'div.row.row-eq-height > div.col-xl-3.col-lg-3.col-md-3.col-4.manga_portada > div.page-item-detail > div.episode_thumb.c-image-hover.index > a > img',
        ['src', 'alt']
      );

      mangaUrlList = webscraper.getElement(
        'div.row.row-eq-height > div.col-xl-3.col-lg-3.col-md-3.col-4.manga_portada > div.page-item-detail > div.episode_thumb.c-image-hover.index > a',
        ['href', 'alt'],
      );  

      mangaChapterList = webscraper.getElement(
        'div.row.row-eq-height > div.col-xl-3.col-lg-3.col-md-3.col-4.manga_portada > div.page-item-detail > div.episode_thumb.c-image-hover.index > a > span',
        [],
      ); 

      setState(() {
        mangaLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchManga();
  }

  @override
  Widget build(BuildContext context) {
    return mangaLoaded
      ? GridView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 5.0,
        ),
        itemCount: mangaList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MangaReader(
                    chapter: mangaChapterList[index]['title'].toString().trim(),
                    chapterLink: mangaUrlList[index]['attributes']['href'],
                    chaptersList: mangaUrlList,
                    index: index,
                    fromLatest: true,
                  ))
                ),
                child: ChapterCard(
                  chapterImg: mangaList[index]['attributes']['src'],
                  chapterTitle: mangaChapterList[index]['title'],
                  chapterUrlList: mangaUrlList[index]['attributes']['href']
                  ),
                ),
              ]
            );
          },
        )
      : Center(child: CircularProgressIndicator(),
    );
  }
}