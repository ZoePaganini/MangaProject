import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LatestChapters extends StatelessWidget {  
  List<int> _listaPaginas = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
  List<int> _listaCapitulos = [13,24,31,51,211,231,251,11,15,18];  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
      ),
      itemCount: _listaCapitulos.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'viewer', arguments: 'detalls peli'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/waiting-image.gif'),
                  image: NetworkImage('https://cdn.readjujutsukaisen.com/file/mangap/2085/10170000/${_listaPaginas[index]}.jpeg'),
                  width: 200,
                  height: 175,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Capitulo ${_listaCapitulos[index]}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        );
      },
    );
  }
}