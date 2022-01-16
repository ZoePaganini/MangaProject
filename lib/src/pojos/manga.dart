import 'package:manga_project/src/pojos/capitulo.dart';

class Manga {
  var nombre;
  var descripcion;
  var autor;
  var status;
  var genero;
  var rating;
  List<Capitulo> capitulos;

  Manga(var nombre, var descripcion, var autor, var status, var genero,
      var rating, List<Capitulo> capitulos) {
    this.nombre = nombre;
    this.descripcion = descripcion;
    this.capitulos = capitulos;
    this.autor = autor;
    this.genero = genero;
    this.status = status;
    this.rating = rating;
  }

  String get nombreManga {
    return nombre;
  }

  String get descripcionManga {
    return descripcion;
  }

  List<Capitulo> get capitulosManga {
    return capitulos;
  }

  set nombreManga(String nombre) {
    this.nombre = nombre;
  }

  set descripcionManga(String descripcion) {
    this.descripcion = descripcion;
  }

  set capitulosManga(List<Capitulo> capitulos) {
    this.capitulos = capitulos;
  }
}
