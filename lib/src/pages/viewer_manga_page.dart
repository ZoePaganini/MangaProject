import 'package:flutter/material.dart';
import 'package:manga_project/src/widgets/page_scroller.dart';
import 'package:manga_project/src/widgets/page_swiper.dart';

bool _modoLectura;

class VisualizarCapitulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(
        onPressed: () {}, 
        icon: Icon(Icons.keyboard_arrow_left)),
        title: Text('Titulo del Capitulo'),
        backgroundColor: Colors.transparent,
        actions: <Widget>[
         
        ],
      ),
      body: PageScroller(),
        //PageSwiper(),
    );
  }
}