import 'package:flutter/material.dart';

class PageScroller extends StatelessWidget {
  List<int> _listaPaginas = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _listaPaginas.length,
          itemBuilder: (BuildContext context, int index) {
            final pagina = _listaPaginas[index];
            return FadeInImage(
              placeholder: AssetImage('assets/waiting-image.gif'), 
              image: NetworkImage('https://cdn.readjujutsukaisen.com/file/mangap/2085/10170000/${pagina}.jpeg'),
              
            );
          }
          
    );
  }
}