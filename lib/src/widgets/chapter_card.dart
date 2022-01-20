import 'package:flutter/material.dart';

class ChapterCard extends StatelessWidget {
  
  final String chapterImg, chapterTitle, chapterUrlList;
  const ChapterCard({Key key, this.chapterImg, this.chapterTitle, this.chapterUrlList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 170,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/waiting-image.gif'),
              image: NetworkImage(chapterImg),
              width: 110,
              height: 144,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            chapterTitle,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}