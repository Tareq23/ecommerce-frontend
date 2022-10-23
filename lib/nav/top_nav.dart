import 'dart:ui';

import 'package:ecommercefrontend/nav/nav_item.dart';
import 'package:ecommercefrontend/widgets/common_widgets.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/colors.dart';
import '../constants/contants.dart';
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
      padding:  EdgeInsets.symmetric(
          horizontal: commonPadding),
      color: BG_GREY,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(
          //   width: overallController.currentWidgetWidth.value * 0.1,
          //   child: InkWell(
          //     onTap: (){
          //       context.go('/');
          //     },
          //     child: _logo(context),
          //   ),
          // ),
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
            width: overallController.currentWidgetWidth.value * 0.4,
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
