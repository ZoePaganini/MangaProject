import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class PageScroller extends StatefulWidget {
  final String mangaLink;
  const PageScroller({Key key, this.mangaLink}) : super(key: key);

  @override
  _PageScroller createState() => _PageScroller();
}

class _PageScroller extends State<PageScroller> {
  
  List<Map<String, dynamic>> chapterPages;
  bool dataFetch = false;

  void getChapterImages() async {
    String chapterUrl = widget.mangaLink.split(".com")[0] + ".com";
    String tempRoute = widget.mangaLink.split(".com")[1];
    final webscraper = WebScraper(chapterUrl);

    if(await webscraper.loadWebPage(tempRoute)) {
      chapterPages = webscraper.getElement(
        'div.container-chapter-reader > img',
        ['src']
        );
    }

    setState(() {
      dataFetch = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return dataFetch
      ? ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return FadeInImage(
            placeholder: AssetImage('assets/waiting-image.gif'), 
            image: NetworkImage(chapterPages[index]['title']));
        })
      : Center(child: CircularProgressIndicator());
  }
}