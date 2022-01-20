import 'package:flutter/cupertino.dart';

BottomNavigationBarItem botNavItem(IconData icon, String title) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: title,
  );
}