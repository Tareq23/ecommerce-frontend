import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/category_model.dart';
import 'package:ecommercefrontend/models/product_model.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductSection extends StatefulWidget {
  final String sectionTitle;
  const ProductSection({Key? key, required this.sectionTitle})
      : super(key: key);
  // static double width = 0;

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {



  static double width = 0;

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;

    return Obx(() {

      width = (overallController.screenWidth.value - commonPadding * 2);
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
                CustomText(
                  text: '${widget.sectionTitle}\t',
                  color: TEXT_DARK,
                  size: 16,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  width: overallController.screenWidth.value * 0.01,
                ),
                Container(
                  height: 5,
                  width: overallController.screenWidth.value * 0.65,
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
              spacing: width * 0.02,
              runSpacing: 40,
              children: productList
                  .map((product) => ProductCard(product: product,width: (width-width*0.06),))
                  .toList(),
            ),
          ],
        ),
      );
    });
  }
}


