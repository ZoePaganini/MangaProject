import 'package:flutter/material.dart';
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
      initialRoute: 'viewer',
      routes: {
        //'main': (BuildContext context) => Main_Page(),
        //'preview': (BuildContext context) => Preview_Manga_Page(),
        'viewer': (BuildContext context) => VisualizarCapitulo(),
      },
      theme: ThemeData.dark(),
    );
  }
}