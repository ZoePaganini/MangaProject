import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:manga_project/src/pages/preview/preview_manga_page.dart';
import 'package:manga_project/src/pages/preview/preview_page_screen.dart';
=======
import 'package:manga_project/src/constants/constants.dart';
import 'package:manga_project/src/pages/main_page.dart';
>>>>>>> 0adcfd17b64159a92b2a69d9b6bd8b4412f45c87
import 'package:manga_project/src/pages/viewer_manga_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'fulldeMangaDealerPlugconCorte',
<<<<<<< HEAD
      initialRoute: 'preview',
      routes: {
        //'main': (BuildContext context) => Main_Page(),
        'preview': (BuildContext context) => PreviewPageScreen(
              //mangaImg: "https://avt.mkklcdnv6temp.com/10/n/22-1599502374.jpg",
              //mangaTitle: "PaquitoElChocolatero",
              mangaLink: "https://chap.manganelo.com/manga-ba116346",
            ),
        //'viewer': (BuildContext context) => VisualizarCapitulo(),
=======
      initialRoute: 'main',
      routes: {
        'main': (BuildContext context) => HomePageNavigator(),
        //'preview': (BuildContext context) => Preview_Manga_Page(),
        'viewer': (BuildContext context) => VisualizarCapitulo(),
>>>>>>> 0adcfd17b64159a92b2a69d9b6bd8b4412f45c87
      },
      theme: ThemeData.dark(),
    );
  }
}
