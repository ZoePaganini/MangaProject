import 'package:flutter/material.dart';

class MangaDesc extends StatefulWidget {
  final String mangaDesc, mangaGenres;

  const MangaDesc({Key key, this.mangaDesc, this.mangaGenres})
      : super(key: key);
  @override
  _MangaDescState createState() => _MangaDescState();
}

class _MangaDescState extends State<MangaDesc> {
  bool readMore = false;
  bool readMoreGenres = false;

  void toggleRead() {
    setState(() {
      readMore = !readMore;
    });
  }

  void toggleReadGenres() {
    setState(() {
      readMoreGenres = !readMoreGenres;
    });
  }

  Widget overMultiLine() {
    return (widget.mangaDesc).length > 30
        ? GestureDetector(
            onTap: toggleRead,
            child: Center(child: Text(
              readMore ? "Leer menos" : "Leer más",
              style: TextStyle(color: Colors.lightBlue, fontSize: 14),
            )),
          )
        : Container();
  }

  Widget overMultiLine2() {
    return (widget.mangaGenres).length > 2
        ? GestureDetector(
            onTap: toggleReadGenres,
            child: Center(child: Text(
              readMoreGenres ? "Leer menos" : "Leer más",
              style: TextStyle(color: Colors.lightBlue, fontSize: 14),
            )),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Descripción",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            Divider(),
            Text(
              widget.mangaDesc.toString().trim(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
              maxLines: readMore ? 100 : 3,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
            ),
            overMultiLine(),
            Divider(),
            Text(
              "Géneros",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            Divider(),
            Text(
              widget.mangaGenres.toString().trim(),
              style: TextStyle(
              color: Colors.white,
              fontSize: 17),
              maxLines: readMoreGenres ? 100 : 3,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              ),
            overMultiLine2()
          ],
        ),
      ),
    );
  }
}
