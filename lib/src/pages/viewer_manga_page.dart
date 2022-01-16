import 'package:flutter/material.dart';
import 'package:manga_project/src/widgets/page_scroller.dart';
import 'package:manga_project/src/widgets/page_swiper.dart';

bool _modoLectura;

class VisualizarCapitulo extends StatelessWidget {
  final int numberChapter;
  final String chapter;
  final String chapterTitle;
  const VisualizarCapitulo({Key key, this.numberChapter, this.chapter, this.chapterTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(
        onPressed: () {}, 
        icon: Icon(Icons.keyboard_arrow_left)),
        title: Text(''),
        backgroundColor: Colors.transparent,
        actions: <Widget>[
         
        ],
      ),
      body: PageScroller(mangaLink: chapter),
        //PageSwiper(),
    );
  }
}