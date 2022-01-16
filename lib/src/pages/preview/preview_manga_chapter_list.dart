import 'package:flutter/material.dart';
import 'package:manga_project/src/pojos/manga.dart';

import '../viewer_manga_page.dart';

class MangaChapters extends StatelessWidget {
  final List<Map<String, dynamic>> mangaChapters;

  const MangaChapters({Key key, this.mangaChapters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: mangaChapters.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              width: double.infinity,
              child: Material(
                color: Colors.black,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VisualizarCapitulo(
                        numberChapter: index + 1,
                        chapter: mangaChapters[index].toString(),
                        chapterTitle: mangaChapters[index]['title'],                        
                      ))
        );
                    }, 
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            mangaChapters[index]['title'],
                            style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: mangaChapters.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            width: double.infinity,
            child: Material(
              color: Colors.black,
              child: InkWell(
                onTap: () => print(mangaChapters[index]['attributes']['href']),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      mangaChapters[index]['title'],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
    */