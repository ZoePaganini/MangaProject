import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class PageSwiper extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.8,
      color: Colors.black,
      child: Swiper(
        itemCount: 25,
        layout: SwiperLayout.STACK,
        itemHeight: size.height * 0.8,
        itemBuilder: (BuildContext context, int index){
          return ClipRRect(
              child: FadeInImage(
                placeholder: AssetImage('assets/waiting-image.gif'),
                // ignore: prefer_const_constructors
                image: NetworkImage('https://cdn.readjujutsukaisen.com/file/mangap/2085/10170000/1.jpeg'),
                fit: BoxFit.cover,
                ),
          );
        },
      ),
    );
  }
}