import 'package:flutter/material.dart';
import 'package:manga_project/src/pages/preview/manga_info_btn.dart';
import 'package:manga_project/src/pages/preview/vert_divider.dart';

class PreviewMangaPage extends StatelessWidget {
  final String mangaImg, mangaStatus, mangaAuthor;

  const PreviewMangaPage(
      {Key key, this.mangaImg, this.mangaStatus, this.mangaAuthor})
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
                  Text("By $mangaAuthor - $mangaStatus")
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
                MangaInfoBtn(icon: Icons.play_arrow_outlined, title: "Read"),
                VertDivider(),
                MangaInfoBtn(
                    icon: Icons.format_list_bulleted_sharp, title: "Chapters"),
                VertDivider(),
                MangaInfoBtn(icon: Icons.videocam, title: "Video"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
