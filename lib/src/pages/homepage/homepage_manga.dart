import 'package:flutter/material.dart';
import 'package:manga_project/src/constants/constants.dart';
import 'package:manga_project/src/pages/viewer/all_manga.dart';
import 'package:manga_project/src/pages/viewer/manga_swiper.dart';

class MangaHome extends StatelessWidget {
  const MangaHome({Key key}) : super(key: key);

  @override
  //_MangaHome createState() => _MangaHome();
  Widget build(BuildContext context) {
    return true
      ? GridView.count(
        crossAxisCount: 1,
        mainAxisSpacing: 1.0,
        children: [
          MangaSwiper(),
          MangaSlider(
            genero: Constants.generos[0],
            generosLink: Constants.generosLink[0],
          ),
          MangaSlider(
            genero: Constants.generos[1],
            generosLink: Constants.generosLink[1],
          ),
          MangaSlider(
            genero: Constants.generos[2],
            generosLink: Constants.generosLink[2],
          ),
          MangaSlider(
            genero: Constants.generos[3],
            generosLink: Constants.generosLink[3],
          ),
          MangaSlider(
            genero: Constants.generos[4],
            generosLink: Constants.generosLink[4],
          ),
        ],
      )
    : Center(child: CircularProgressIndicator());
  }
}
