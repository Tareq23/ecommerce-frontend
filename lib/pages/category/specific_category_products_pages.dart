

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/nav/second_top_nav.dart';
import 'package:ecommercefrontend/pages/home/footer_section/footer_section.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SpecificCategoryProductsPage extends StatelessWidget {
  const SpecificCategoryProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const TopNav(),
        // const SizedBox(height: 24,),
        // const SearchNav(),
        // const SizedBox(height: 24,),
        const SecondTopNav(),
        SizedBox(
          width: overallController.screenWidth.value,
          height: 400,
          child: Center(
            child: CustomText(text: 'Specific Category Page!!!!',),
          ),
        ),
        FooterSection(height: 500,),
        // homePageWidgetList.elementAt(homePageContentIndex),
      ],
    );
  }
}