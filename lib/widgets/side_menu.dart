import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/helpers/responsiveness.dart';
import 'package:ecommercefrontend/routing/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/style.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      child: ListView(
        children: [
          // Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     const SizedBox(
          //       height: 40,
          //     ),
          //     Row(
          //       children: [
          //         SizedBox(
          //           width: _width / 48,
          //         ),
          //         Padding(
          //           padding: EdgeInsets.only(right: 12),
          //           child: Image.asset("assets/icons/logo.png"),
          //         ),
          //         Flexible(
          //             child: CustomText(
          //           text: "Dash",
          //           size: 20,
          //           weight: FontWeight.bold,
          //           color: active,
          //         )),
          //         SizedBox(
          //           width: _width / 48,
          //         ),
          //       ],
          //     ),
          //
          //   ],
          // ),
          const SizedBox(
            height: 40,
          ),
          Divider(
            color: lightGrey.withOpacity(0.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map(
                  (item) => SideMenuItem(
                itemName:
                item == AuthenticationPageRoute ? "Log out" : item,
                onTap: () {
                  if(item == AuthenticationPageRoute){
                    //ToDo go to authentication page
                  }
                  if(!menuController.isActive(item)){
                    menuController.changeActiveItemTo(item);
                    if(ResponsiveWidget.isSmallScreen(context)){
                      Get.back();
                    }
                    // go to item name route
                  }
                },
              ),
            )
                .toList(),
          )
        ],
      ),
    );
  }
}
