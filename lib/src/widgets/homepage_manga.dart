import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class MangaHome extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 20.0,
      children: [
        MangaSwiper(),
        MangaSlider(),
        MangaSlider()
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
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (BuildContext context, int index){

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'detalls peli'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/waiting-image.gif'),
                image: NetworkImage('https://static.wikia.nocookie.net/jujutsu-kaisen/images/8/8e/Jujutsu_Kaisen_Manga_Volumen_14_JP.jpg/revision/latest?cb=20201216182108&path-prefix=es'),
                fit: BoxFit.contain
               ),
            ),
          );
        },
      )
    );
  }
}

class _MangaPoster extends StatelessWidget {
  const _MangaPoster({Key key}) : super(key: key);

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
                image: NetworkImage('https://www.normaeditorial.com/upload/media/albumes/0001/16/15bb917dd73b8961b8ec1551b071f636dccb3cd6.jpeg'),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5,),
          Text(
            'Titulo del manga',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
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
            child: Text('Populars', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_, int index) => _MangaPoster()
            ),
          )
        ],
      ),
    );
  }
}