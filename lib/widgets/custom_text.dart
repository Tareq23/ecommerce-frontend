import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final double size;
  final double letterSpacing;
  final double wordSpacing;
  final Color color;
  const CustomText(
      {Key? key,
      required this.text,
      this.size = 14,
      this.weight = FontWeight.w400,
      this.color = TEXT_DARK,
      this.letterSpacing = 1,
      this.wordSpacing = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing),
    );
  }
}
