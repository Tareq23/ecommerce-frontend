

import 'package:ecommercefrontend/constants/style.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  double? size;
  Color? color;
  FontWeight? weight;

  CustomText({Key? key,required this.text,this.size,this.color,this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color??dark,fontSize: size??14,fontWeight: weight??FontWeight.normal),
    );
  }
}
