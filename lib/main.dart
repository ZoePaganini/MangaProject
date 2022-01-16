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
      home: HomePageNavigator(),
      /*initialRoute: 'main',
      routes: {
        'main': (BuildContext context) => HomePageNavigator(),
        //'preview': (BuildContext context) => PreviewPageScreen(),
        //'viewer': (BuildContext context) => VisualizarCapitulo(),
      },
      onGenerateRoute: (RouteSettings settings) {
        var manga;
        String routeName = settings.name;
        switch (routeName){
          case PreviewPageScreen.routeName:
            manga = PreviewPageScreen(mangaLink: settings.arguments,);
            break;
          case VisualizarCapitulo.routeName:
            manga = VisualizarCapitulo();
            break;
        }
        return MaterialPageRoute(builder : (context) => manga);
      },*/
      theme: ThemeData.dark(),
    );
  }
}
