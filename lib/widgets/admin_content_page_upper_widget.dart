import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AdminPageContentUpperWidget extends StatelessWidget {
  final String pageTitle;
  final VoidCallback onTap;
  final String linkTitle;
  const AdminPageContentUpperWidget({Key? key, required this.pageTitle, required this.onTap, required this.linkTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: overallController.adminMainContentWidth.value - 18,
      height: 100,
      // decoration: const BoxDecoration(color: Colors.yellow),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: pageTitle,size: 22,weight: FontWeight.w600,),
          InkWell(
            onTap: onTap,
            child: CustomText(text: linkTitle,size: 20,weight: FontWeight.w500,),
          )
        ],
      ),

    );
  }
}
