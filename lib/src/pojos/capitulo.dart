import 'package:manga_project/src/pojos/pagina.dart';

class Capitulo {
  var numero;
  var nombre;
  List<Pagina> paginas;

  int get numeroCapitulo {
    return numero;
  }

  set nombreCapitulo(String nombre) {
    this.nombre = nombre;
  }

  List<Pagina> get paginasCapitulo => paginas;

  set paginasCapitulo(List<Pagina> paginas) {
    paginas = paginas;
  }

  Capitulo(int numero, String nombre, List<Pagina> paginas) {
    this.numero = numero;
    this.nombre = nombre;
    this.paginas = paginas;
  }
}
