import 'package:flutter/material.dart';
import 'package:manga_project/src/pages/homepage/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MangaPlug',
      home: HomePageNavigator(),
      theme: ThemeData.dark(),
    );
  }
}
