import 'package:flutter/material.dart';

class MangaCard extends StatelessWidget {
  
  final String mangaImg, mangaTitle;
  const MangaCard({Key key, this.mangaImg, this.mangaTitle});

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
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'detalls peli'),
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