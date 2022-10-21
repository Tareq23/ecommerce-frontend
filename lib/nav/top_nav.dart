import 'dart:ui';

import 'package:ecommercefrontend/nav/nav_item.dart';
import 'package:ecommercefrontend/widgets/common_widgets.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/colors.dart';
import '../constants/controllers.dart';
import '../helpers/responsive_widget.dart';

List<String> _leftItem = ["about", "contact", "help"];
List<String> _rightItem = ["login", "register"];

class TopNav extends StatelessWidget {
  const TopNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("==========================> Top Nav ${_leftItem.length}");
    return Container(
      width: double.infinity,
      height: 40,
      padding: EdgeInsets.symmetric(
          horizontal: overallController.currentWidgetWidth.value * 0.007),
      color: BG_GREY,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: overallController.currentWidgetWidth.value * 0.1,
            child: InkWell(
              onTap: (){
                context.go('/');
              },
              child: _logo(context),
            ),
          ),
          SizedBox(
            width: overallController.currentWidgetWidth.value * 0.35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _leftItem.map(
                (e) {
                  return NavItem(
                    title: e.toUpperCase(),
                    onTap: () {
                      // print('--------------------$e');
                      if (!itemButtonController.isActive(e)) {
                        itemButtonController.changeActiveItemTo(e);
                        context.go('/${e.toLowerCase()}');
                      }
                    },
                  );
                },
              ).toList(),
            ),
          ),
          // const CustomText(text: 'Checking Text'),
          SizedBox(
            width: overallController.currentWidgetWidth.value * 0.45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: _rightItem
                  .map(
                    (e) => NavItem(
                        title: e.toUpperCase(),
                        onTap: () {
                          if (!itemButtonController.isActive(e)) {
                            itemButtonController.changeActiveItemTo(e);
                            // navigationController.navigateTo(item);
                            // go to item name route
                            context.go('/${e.toLowerCase()}');
                          }
                        }),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Center _logo(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          gradient:  LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffc0bebe).withOpacity(0.8),
                Color(0xff725c5c).withOpacity(0.8),
                Color(0xff9b9260).withOpacity(0.8),
                Color(0xff587e2b).withOpacity(0.8),
                Color(0xff228f73).withOpacity(0.8),
                Color(0xff162644).withOpacity(0.8),
                Color(0xff620429).withOpacity(0.8),
              ]),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: BORDER_RED, width: 1.2),
        ),
        child: const CustomText(
          text: 'LOGO',
          color: Color(0xfff5f5f5),
          size: 24,
          weight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _NavItem({required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomText(
        text: title,
      ),
    );
  }
}
