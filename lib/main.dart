import 'package:flutter/material.dart';
import 'package:manga_project/src/pages/preview/preview_page_screen.dart';
import 'package:manga_project/src/constants/constants.dart';
import 'package:manga_project/src/pages/homepage/main_page.dart';
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
      initialRoute: 'main',
      routes: {
        'main': (BuildContext context) => HomePageNavigator(),
        'preview': (BuildContext context, String url) => PreviewPageScreen(url),
        'viewer': (BuildContext context) => VisualizarCapitulo(),
      },
      theme: ThemeData.dark(),
    );
  }
}
