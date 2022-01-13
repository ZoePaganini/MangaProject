class Pagina {
  var numero;
  var url;

  Pagina({this.numero, this.url});

  int get numeroPagina {
    return numero;
  }

  void set numeroPagina(int numero) {
    this.numero = numero;
  }

  String get urlImage {
    return url;
  }

  void set urlImage(String url) {
    this.url = url;
  }
}