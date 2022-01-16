import 'package:flutter/cupertino.dart';
import 'package:manga_project/src/constants/constants.dart';

BottomNavigationBarItem botNavItem(IconData icon, String title) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: title,
    //backgroundColor: Constants.black
  );
}