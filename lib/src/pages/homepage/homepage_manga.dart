import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:manga_project/src/widgets/manga_card.dart';

class MangaHome extends StatelessWidget {  
  
  
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 1.0,
      children: [
        MangaSwiper(),
        MangaSlider(),
      ],);
  }
}

class MangaSwiper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      // Aquest multiplicador estableix el tant per cent de pantalla ocupada 50%
      height: size.height * 0.5,
      // color: Colors.red,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Popular', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10,),
          Swiper(
            containerWidth: 1000,
            itemCount: 3,
            layout: SwiperLayout.STACK,
            itemWidth: size.width,
            itemHeight: size.height * 0.4,
            itemBuilder: (BuildContext context, int index){
              List<String> _popularManga = ['https://i0.wp.com/elpalomitron.com/wp-content/uploads/2020/07/Rese%C3%B1a-de-Jujutsu-Kaisen-destacada-El-Palomitr%C3%B3n.jpg?resize=1100%2C600&ssl=1', 'https://i2.wp.com/www.senpai.com.mx/wp-content/uploads/2021/07/Manga-de-Chainsaw-Man-alcanza-11-millones-de-copias-en-circulacion.jpg?fit=1280%2C685&ssl=1', 'https://p4.wallpaperbetter.com/wallpaper/204/423/604/1920x1080-px-manga-sasaki-kojirou-vagabond-animals-squirrels-hd-art-wallpaper-preview.jpg'];
              List<String> _mangaSites = ['https://chap.manganelo.com/manga-ba116346','https://chap.manganelo.com/manga-dn117633','https://chap.manganelo.com/manga-je92124'];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () { 
                      Navigator.pushNamed(context, 'preview', arguments: _mangaSites[index]);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/waiting-image.gif'),
                        image: NetworkImage(_popularManga[index]),
                        fit: BoxFit.cover,
                        height: 320,
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      )
    );
  }
}

class MangaSlider extends StatelessWidget {
  // const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('All Mangas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, int index) => MangaCard(
                mangaImg: 'https://www.normaeditorial.com/upload/media/albumes/0001/16/15bb917dd73b8961b8ec1551b071f636dccb3cd6.jpeg',
                mangaTitle: 'Jujutsu Kaisen',
              )
            ),
          )
        ],
      ),
    );
  }
}