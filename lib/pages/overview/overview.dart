import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/helpers/responsiveness.dart';
import 'package:ecommercefrontend/pages/overview/widgets/overview_cards_large_screen.dart';
import 'package:ecommercefrontend/pages/overview/widgets/overview_cards_medium_screen.dart';
import 'package:ecommercefrontend/pages/overview/widgets/overview_cards_small_screen.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: ResponsiveWidget.isLargeScreen(context) ? 60 : 8,
                ),
                child: CustomText(
                  text: menuController.activeItem.value,
                  size: 22,
                  weight: FontWeight.bold,
                ),
              )
            ],
          );
        }),
        Expanded(
          child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context))
                OverviewCardLargeScreen(),
              if(ResponsiveWidget.isMediumScreen(context))
                OverviewCardMediumScreen(),
              if (ResponsiveWidget.isSmallScreen(context))
                OverviewCardSmallScreen(),
            ],
          ),
        )
      ],
    );
  }
}
