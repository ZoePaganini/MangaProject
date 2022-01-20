import 'package:flutter/material.dart';

class HorDivider extends StatelessWidget {
  final double height;

  const HorDivider({Key key, this.height}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: Colors.white,
    );
  }
}
