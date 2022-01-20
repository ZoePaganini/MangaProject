import 'package:flutter/material.dart';
import '../viewer/viewer_manga_page.dart';

class MangaChapters extends StatelessWidget {
  final List<Map<String, dynamic>> mangaChapters;
  final String mangaLink, mangaImg, mangaTitle;

  const MangaChapters({Key key, this.mangaChapters, this.mangaLink, this.mangaImg, this.mangaTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Capítulos",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            Divider(),
            ListView.builder(
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
                            MaterialPageRoute(
                                builder: (context) => MangaReader(
                                      chapterLink: mangaChapters[index]
                                          ['attributes']['href'],
                                      chapter: mangaChapters[index]['title'].toString().trim(),
                                      chaptersList: mangaChapters,
                                      index: index,
                                      mangaLink: mangaLink,
                                      mangaTitle: mangaTitle,
                                      mangaImg: mangaImg,
                                      fromLatest: false,
                                    )
                                    ));
                      },
                      child: Text(
                        mangaChapters[index]['title'].toString().trim(),
                        style: TextStyle(color: Colors.white),
                        //overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
