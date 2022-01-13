import 'package:flutter/material.dart';
import 'package:manga_project/src/widgets/page_swiper.dart';

class VisualizarCapitulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: PageSwiper(),
        ),
      ),
    );
  }
}