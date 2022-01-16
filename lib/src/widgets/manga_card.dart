import 'package:flutter/material.dart';
import 'package:manga_project/src/pages/preview/preview_page_screen.dart';

class MangaCard extends StatelessWidget {
  
  final String mangaImg, mangaTitle, mangaUrlList;
  const MangaCard({Key key, this.mangaImg, this.mangaTitle, this.mangaUrlList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PreviewPageScreen(
                mangaImg: mangaImg,
                mangaTitle: mangaTitle,
                mangaLink: mangaUrlList,
              ))
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/waiting-image.gif'),
                image: NetworkImage(mangaImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5,),
          Text(
            mangaTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}