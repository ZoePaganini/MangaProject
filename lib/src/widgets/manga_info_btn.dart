import 'package:flutter/material.dart';

class MangaInfoBtn extends StatelessWidget {
  final IconData icon;
  final String title;

  const MangaInfoBtn({Key key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 35),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
