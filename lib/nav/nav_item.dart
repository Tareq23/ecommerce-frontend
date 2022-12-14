import 'dart:io';

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final double textSize;
  NavItem({Key? key, required this.title, required this.onTap,this.color,this.textSize=16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("=================== top nav item $title");
    return Container(
      padding: const EdgeInsets.all(0),
      margin: EdgeInsets.only(right: title.contains('register'.toUpperCase()) ? 0 : 10),
      child: InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              ? itemButtonController.onHover(title)
              : itemButtonController.onHover('/');
        },
        child: Obx(() {
          return Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: (itemButtonController.isHovering(title) || itemButtonController.isActive(title))
                  ? const Border(
                      bottom: BorderSide(width: 1.2, color: ITEM_HOVER),
                    )
                  : null,
            ),
            child: CustomText(
              text: title,
              size: textSize,
              weight: FontWeight.w500,
              // color: Colors.white,
              color: (itemButtonController.isHovering(title) || itemButtonController.isActive(title))
                  ? ITEM_HOVER
                  : color??TEXT_DARK,
            ),
          );
        }),
      ),
    );
  }
}
