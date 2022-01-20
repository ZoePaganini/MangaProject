import 'package:flutter/material.dart';
import 'package:manga_project/src/constants/constants.dart';
import 'package:manga_project/src/pages/preview/preview_page_screen.dart';
import 'package:manga_project/src/widgets/hor_divider.dart';
import 'package:web_scraper/web_scraper.dart';

class MangaReader extends StatefulWidget {
  final List<Map<String, dynamic>> chaptersList;
  final String chapter, previousChapter, nextChapter, chapterLink, mangaLink, mangaTitle, mangaImg;
  final int index;
  final bool fromLatest;
  

  const MangaReader({Key key, this.chaptersList, this.chapter, this.previousChapter, this.nextChapter, this.chapterLink, this.index, this.mangaLink, this.mangaTitle, this.mangaImg, this.fromLatest}) : super(key: key);

  @override
  _MangaReader createState() => _MangaReader();
}

class _MangaReader extends State<MangaReader> {
  
  List<Map<String, dynamic>> chapterPages;
  bool dataFetch = false;
  int back = 0;
  int next = 0;

  static get index => null;


  void getChapterImages() async {
    String chapterUrl = widget.chapterLink.split(".com")[0] + ".com";
    String tempRoute = widget.chapterLink.split(".com")[1];
    final webscraper = WebScraper(chapterUrl);
  
    if(await webscraper.loadWebPage(tempRoute)) {
      chapterPages = webscraper.getElement(
        '#images_chapter > img',
        ['data-src'],
        );
        

      setState(() {
      dataFetch = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getChapterImages();
  }

  @override
  Widget build(BuildContext context) {
    if ((widget.index == widget.chaptersList.length)) {
      back = widget.index;
    } else {
      back = widget.index + 1;
    }
    if ((widget.index == 0)) {
      next = widget.index;
    } else {
      next = widget.index - 1;
    }
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(
        onPressed: () {
            if((widget.fromLatest == false)) {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => PreviewPageScreen(
                mangaImg: widget.mangaImg,
                mangaTitle: widget.mangaTitle,
                mangaLink: widget.mangaLink,
                fromReader: true
                )
              )
            );
          } else {
            Navigator.pop(context);
          }        
        },
        icon: Icon(Icons.arrow_back)),
        title: Text(widget.chapter),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if(widget.fromLatest == false) {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => MangaReader(
                    chaptersList: widget.chaptersList,
                    chapter: widget.chaptersList[back]['title'].toString().trim(),
                    chapterLink: widget.chaptersList[back]["attributes"]["href"],
                    index: back,
                    mangaImg: widget.mangaImg,
                    mangaTitle: widget.mangaTitle,
                    mangaLink: widget.mangaLink,
                    fromLatest: false,
                    )
                  )
                );
              }
            },
            icon: Icon(Icons.keyboard_arrow_left_outlined),
          ),
          IconButton(
            onPressed: () {
              if (next != 0 && widget.fromLatest == false) {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => MangaReader(
                    chaptersList: widget.chaptersList,
                    chapter: widget.chaptersList[next]['title'].toString().trim(),
                    chapterLink: widget.chaptersList[next]["attributes"]["href"],
                    index: next,
                    mangaImg: widget.mangaImg,
                    mangaTitle: widget.mangaTitle,
                    mangaLink: widget.mangaLink,
                    fromLatest: false,
                    )
                  )
                );
              }     
            },
            icon: Icon(Icons.keyboard_arrow_right_outlined),            
          ),
        ],
      ),
      body: dataFetch
      ? ListView.builder(
        itemCount: chapterPages.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              FadeInImage(
                placeholder: AssetImage('assets/waiting-image.gif'), 
                image: NetworkImage(chapterPages[index]['attributes']['data-src'])),
                HorDivider(height: 10,)
            ],
          );
        })
      : Center(child: CircularProgressIndicator()),
    );
  }
}

