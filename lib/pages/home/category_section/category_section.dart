import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/category_model.dart';
import 'package:ecommercefrontend/widgets/category_card_widget.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);
  static double _width = 0;
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;

    return Obx(() {
      _width = (overallController.screenWidth.value - commonPadding * 2);
      return Container(
        width: overallController.screenWidth.value,
        padding: EdgeInsets.symmetric(horizontal: commonPadding),
        color: Colors.transparent,
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: 'Category\t',
                  color: TEXT_DARK,
                  size: 16,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  width: overallController.screenWidth.value * 0.01,
                ),
                Container(
                  height: 5,
                  width: overallController.screenWidth.value * 0.75,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 3, color: TEXT_DARK, style: BorderStyle.solid),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Wrap(
              spacing: _width * 0.02,
              runSpacing: 40,
              children: categoryList
                  .map((category) => CategoryCard(category: category))
                  .toList(),
            )
          ],
        ),
      );
    });
  }
}
