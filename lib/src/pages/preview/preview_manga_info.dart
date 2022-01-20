import 'package:flutter/material.dart';
import 'package:manga_project/src/widgets/manga_info_btn.dart';
import 'package:manga_project/src/widgets/vert_divider.dart';
import '../viewer/viewer_manga_page.dart';

class PreviewMangaPage extends StatelessWidget {
  final String mangaImg, mangaType, mangaYear, mangaTitle, mangaLink;
  final List<Map<String, dynamic>> mangaChapters;

  const PreviewMangaPage(
      {Key key,
      this.mangaImg,
      this.mangaType,
      this.mangaYear,
      this.mangaChapters, this.mangaTitle, this.mangaLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 285,
      width: double.infinity,
      color: Colors.black,
      child: Column(
        children: [
          //Banner aqui
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 175,
                    width: 130,
                    child: Image.network(
                      mangaImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("${mangaType.trim()} - ${mangaYear.trim()}")
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () => {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => MangaReader(
                          chaptersList: mangaChapters,
                          chapter: mangaChapters.last['title'].toString().trim(),
                          chapterLink: mangaChapters.last["attributes"]["href"],
                          index: mangaChapters.length,
                          mangaImg: mangaImg,
                          mangaLink: mangaLink,
                          mangaTitle: mangaTitle,
                          fromLatest: false,
                          )
                        )
                      )
                    },
                    child: MangaInfoBtn(
                      icon: Icons.play_arrow_outlined, title: "Leer")),
                      VertDivider(),
                      InkWell(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MangaReader(
                                chaptersList: mangaChapters,
                                chapter: mangaChapters.first['title'].toString().trim(),
                                chapterLink: mangaChapters.first["attributes"]["href"],
                                index: 0,
                                mangaImg: mangaImg,
                                mangaLink: mangaLink,
                                mangaTitle: mangaTitle,
                                fromLatest: false,
                                )))
                        },
                    child: MangaInfoBtn(
                        icon: Icons.last_page_outlined, title: "Último")),
                ],
            ),
          ),
        ],
      ),
    );
  }
}
