import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class PageSwiper extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      color: Colors.black,
      child: Swiper(
        itemWidth: width,
        itemCount: 25,
        layout: SwiperLayout.STACK,
        itemHeight: height,
        itemBuilder: (BuildContext context, int index){
          return ClipRRect(
              child: FadeInImage(
                placeholder: AssetImage('assets/waiting-image.gif'),
                // ignore: prefer_const_constructors
                image: NetworkImage('https://cdn.readjujutsukaisen.com/file/mangap/2085/10170000/1.jpeg'),
                fit: BoxFit.contain,
                ),
          );
        },
      ),
    );
  }
}

/*List<NetworkImage> _networkImage() {
  List<NetworkImage> imagenes;
  
  return imagenes;
}
*/
