

import 'package:ecommercefrontend/constants/style.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class InfoCardSmallScreen extends StatelessWidget {
  final String title;
  final String value;
  final Color topColor;
  final bool isActive;
  final VoidCallback onTap;
  const InfoCardSmallScreen({Key? key,required this.title,required this.value,required this.topColor,required this.isActive,required this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: isActive ? active : lightGrey ,width: 0.5 ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: title,size: 24,weight: FontWeight.w300,color: isActive ? active : lightGrey,),
              CustomText(text: title,size: 24,weight: FontWeight.bold,color: isActive ? active : lightGrey,),
            ],
          ),
        ),
      ),
    );
  }
}
