import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NotFoundContent extends StatelessWidget {
  const NotFoundContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomText(text:'Not Found',color: TEXT_WHITE,size: 28,letterSpacing: 1.4,),
    );
  }
}
