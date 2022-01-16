import 'package:flutter/material.dart';
import 'package:manga_project/src/pages/preview/preview_manga_page.dart';
import 'package:manga_project/src/pages/preview/preview_page_screen.dart';
import 'package:manga_project/src/pages/viewer_manga_page.dart';
import 'package:manga_project/src/pojos/manga.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'fulldeMangaDealerPlugconCorte',
      initialRoute: 'preview',
      routes: {
        //'main': (BuildContext context) => Main_Page(),
        'preview': (BuildContext context) => PreviewPageScreen(
              //mangaImg: "https://avt.mkklcdnv6temp.com/10/n/22-1599502374.jpg",
              //mangaTitle: "PaquitoElChocolatero",
              mangaLink: "https://chap.manganelo.com/manga-ba116346",
            ),
        //'viewer': (BuildContext context) => VisualizarCapitulo(),
      },
      theme: ThemeData.dark(),
    );
  }
}
