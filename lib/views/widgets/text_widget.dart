import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  const TextWidget({super.key, required this.text,  this.color = Colors.white,
     this.fontSize = 16,  this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return  Text(text,style:  TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize
    ),);
  }
}
