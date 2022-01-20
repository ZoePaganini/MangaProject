import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:manga_project/src/constants/constants.dart';
import 'package:manga_project/src/widgets/manga_card.dart';
import 'package:web_scraper/web_scraper.dart';

class MangaSlider extends StatefulWidget {
  final String genero, generosLink;
  const MangaSlider({Key key, this.genero, this.generosLink}) : super(key: key);

  @override
  _MangaSlider createState() => _MangaSlider();
}

class _MangaSlider extends State<MangaSlider> {
  List<Map<String, dynamic>> mangaList;
  List<Map<String, dynamic>> mangaUrlList;
  bool mangaLoaded = false;


  void fetchManga() async {
    final webscraper = WebScraper(Constants.mangaUrl);

    if (await webscraper.loadWebPage('/genero/${widget.generosLink}')) {
      mangaList = webscraper.getElement(
        'div.row.row-eq-height > div.col-xl-3.col-md-3.col-6.manga_portada > div.page-item-detail > div.manga_biblioteca.c-image-hover > a > img',
        ['src', 'title']);

      mangaUrlList = webscraper.getElement(
        'div.row.row-eq-height > div.col-xl-3.col-md-3.col-6.manga_portada > div.page-item-detail > div.manga_biblioteca.c-image-hover > a',
        ['href'],
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
      ? Container(
          width: double.infinity,
          height: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: /*AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      widget.genero,
                      textStyle: (fontSize: 20, fontWeight: FontWeight.bold)
                    )
                  ],
                )*/
                Text(widget.genero, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: mangaList.length,
                  itemBuilder: (_, int index) => MangaCard(
                    mangaImg: mangaList[index]['attributes']['src'],
                    mangaTitle: mangaList[index]['attributes']['title'],
                    mangaUrlList: mangaUrlList[index]['attributes']['href'],
                  )
                ),
              ),
        ],
      ),
    ) : Center(child: CircularProgressIndicator());
  }
}