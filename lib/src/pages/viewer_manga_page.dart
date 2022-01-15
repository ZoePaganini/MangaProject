import 'package:flutter/material.dart';
import 'package:manga_project/src/widgets/page_swiper.dart';

class VisualizarCapitulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo del Capitulo'),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.arrow_back_ios_rounded)
            ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.arrow_forward_ios_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: PageSwiper(),
        ),
      ),
    );
  }
}