import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class PageSwiper extends StatelessWidget {
  List<int> _listaPaginas = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
  
  @override
  Widget build(BuildContext context) {
    
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.topCenter,
      height: height,
      color: Colors.black,
      child: Swiper(
        itemWidth: width,
        itemCount: _listaPaginas.length,
        layout: SwiperLayout.STACK,
        itemHeight: height,
        itemBuilder: (BuildContext context, int index){
          final pagina = _listaPaginas[index];
          return ClipRRect(
              child: FadeInImage(
                placeholder: AssetImage('assets/waiting-image.gif'),
                image: NetworkImage('https://cdn.readjujutsukaisen.com/file/mangap/2085/10170000/${pagina}.jpeg'),
                fit: BoxFit.scaleDown,
                ),
          );
          /*return SizedBox.expand(
            child: Image.network(
              'https://cdn.readjujutsukaisen.com/file/mangap/2085/10170000/1.jpeg',
              fit: BoxFit.scaleDown,
            ),
          );*/
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
