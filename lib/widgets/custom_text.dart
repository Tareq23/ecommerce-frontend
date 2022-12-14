import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final double size;
  final double letterSpacing;
  final double wordSpacing;
  final Color color;
  final TextAlign? textAlign;
  final TextDecoration decoration;
  const CustomText(
      {Key? key,
      required this.text,
      this.size = 14,
      this.weight = FontWeight.w400,
      this.color = TEXT_DARK,
      this.letterSpacing = 1,
      this.wordSpacing = 1.2,
      this.textAlign, this.decoration = TextDecoration.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        decoration: decoration,
      ),
    );
  }
}

class CustomRichText extends StatelessWidget {
  final String titleText;
  final String valueText;
  final FontWeight weight;
  final double size;
  final double letterSpacing;
  final double wordSpacing;
  final Color titleColor;
  final Color valueColor;
  final TextAlign? textAlign;
  const CustomRichText(
      {Key? key,
        required this.titleText,
        required this.valueText,
        this.size = 14,
        this.weight = FontWeight.w400,
        this.titleColor = TEXT_DARK,
        this.valueColor = TEXT_DARK,
        this.letterSpacing = 1,
        this.wordSpacing = 1.2,
        this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign??TextAlign.left,
      text: TextSpan(
        text: titleText,
        style: TextStyle(
          color: titleColor,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
        ),
        children: [
          TextSpan(
              text: ' $valueText',
              style: TextStyle(
                color: valueColor,
                fontSize: size,
                fontWeight: weight,
                letterSpacing: letterSpacing,
                wordSpacing: wordSpacing,
              ),
          ),
        ]
      ),
    );
  }
}
