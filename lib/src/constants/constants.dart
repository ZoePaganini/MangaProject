import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static const String mangaUrl = "https://tmomanga.com";
  static const List<String> popularMangaSites = ['https://tmomanga.com/manga/jujutsu-kaisen','https://tmomanga.com/manga/chainsawman', 'https://tmomanga.com/manga/one-piece', 'https://tmomanga.com/manga/dandadan', 'https://tmomanga.com/manga/bleach'];
  static const List<String> popularMangaTitles = ['Jujutsu Kaisen','Chainsawman','One Piece', 'Dandadan', 'Bleach'];
  static const List<String> popularImages = ['https://i0.wp.com/elpalomitron.com/wp-content/uploads/2020/07/Rese%C3%B1a-de-Jujutsu-Kaisen-destacada-El-Palomitr%C3%B3n.jpg?resize=1100%2C600&ssl=1', 'https://i2.wp.com/www.senpai.com.mx/wp-content/uploads/2021/07/Manga-de-Chainsaw-Man-alcanza-11-millones-de-copias-en-circulacion.jpg?fit=1280%2C685&ssl=1', 'https://ramenparados.com/wp-content/uploads/2021/01/IMG_20210104_085240.jpg', 'https://i.ytimg.com/vi/ScCKbr7HKBQ/maxresdefault.jpg', 'https://p4.wallpaperbetter.com/wallpaper/845/469/115/bleach-hollow-ichigo-ichigo-kurosaki-zangetsu-bleach-wallpaper-preview.jpg'];
  static const List<String> popularMangaImages = ['https://images.tmomanga.com/cover/5f921f6406a16.jpg','https://images.tmomanga.com/cover/5fee445d50143.jpg', 'https://images.tmomanga.com/cover/5f83ddd504164.jpg', 'https://images.tmomanga.com/cover/61e720763a009.jpg', 'https://images.tmomanga.com/cover/5fee5bb2ed799.jpg'];
  static const List<String> generos = ['Sobrenatural', 'Horror', 'Samurái', 'Artes Marciales', 'Aventura'];
  static const List<String> generosLink = ['sobrenatural', 'horror?page=6', 'samurai?page=2', 'artes-marciales', 'aventura?page=2'];

  static const List<Color> colores = [amber, white, darkgrey];
  static const Color darkgrey = Color.fromRGBO(35,35,35, 1);
  static const Color lightgrey = Color.fromRGBO(211, 211, 211, 1);
  static const Color black = Color.fromRGBO(5, 5, 5, 1);
  static const Color amber = Color.fromRGBO(255, 191, 0, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
}