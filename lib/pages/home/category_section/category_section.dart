import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/category_model.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);
  static double _width=0;
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;

    return Obx((){
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
                              width: 3,
                              color: TEXT_DARK,
                              style: BorderStyle.solid),),),
                )
              ],
            ),
            const SizedBox(height: 24,),
            Wrap(
              spacing: _width * 0.02,
              runSpacing: 40,
              children: categoryList
                  .map((category) => _CategoryCard(category: category))
                  .toList(),
            )
          ],
        ),
      );
    });
  }
}


class _CategoryCard extends StatelessWidget {
  final Category category;
  _CategoryCard({Key? key, required this.category}) : super(key: key);
  static double _width=0;
  double _cardHeight = 150;
  @override
  Widget build(BuildContext context) {
    return Obx((){
      _width = (overallController.screenWidth.value - commonPadding * 2);
      _width = _width - (_width* 0.02);
      return Container(
        width: _width * 0.325,
        height: _cardHeight,
        padding: const EdgeInsets.all(0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Container(
              width: (_width * 0.3) * 0.4,
              height: _cardHeight,
              padding: const EdgeInsets.all(8),
              child: Image.network(
                category.imageUrl.toString(),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
           Container(
              width: (_width * 0.3) * 0.6,
              height: _cardHeight,
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: category.title.toString(),size: 18,weight: FontWeight.w500,color: TEXT_DARK,),
                  const SizedBox(height: 15,),
                  CustomText(text: category.numberOfProduct.toString(),size: 18,weight: FontWeight.w500,color: TEXT_DARK,),
                ],
              )
            ),
          ],
        ),
      );
    });
  }
}
