import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:manga_project/src/constants/constants.dart';
import 'package:manga_project/src/pages/preview/preview_page_screen.dart';

class MangaSwiper extends StatelessWidget {


  const MangaSwiper({Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      // Aquest multiplicador estableix el tant per cent de pantalla ocupada 50%
      height: size.height * 0.6,
      // color: Colors.red,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        "Populares",
                        colors: [Colors.red, Colors.blue, Colors.white, Colors.amber],
                        textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                    isRepeatingAnimation: true,
                    repeatForever: true,
                  )
            //child: Text('Popular', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10,),
          Swiper(
            containerWidth: 1000,
            itemCount: Constants.popularImages.length,
            layout: SwiperLayout.STACK,
            itemWidth: size.width,
            itemHeight: size.height * 0.4,
            itemBuilder: (BuildContext context, int index){
              return Column(
                children: [
                  GestureDetector(
                    onTap: () { 
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PreviewPageScreen(
                          mangaImg: Constants.popularMangaImages[index],
                          mangaTitle: Constants.popularMangaTitles[index],
                          mangaLink: Constants.popularMangaSites[index])));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/waiting-image.gif'),
                        image: NetworkImage(Constants.popularImages[index]),
                        fit: BoxFit.cover,
                        height: size.height * 0.4,
                        width: size.width,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      )
    );
  }
}