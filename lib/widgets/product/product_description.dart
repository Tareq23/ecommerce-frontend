import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../constants/controllers.dart';

class ProductDescriptionWidget extends StatelessWidget {
  String? description;
  ProductDescriptionWidget({Key? key,this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width - 2 * commonPadding;
    return Container(
      width: width,
      padding: const EdgeInsets.all(0),
      child: Obx((){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
              text: 'Product details of ${productController.selectedProductForDetails.value.title}',
              size: 16,
              weight: FontWeight.w500,
              color: TEXT_DARK,
            ),
            const SizedBox(
              height: 20,
            ),
            Html(data: productController.selectedProductForDetails.value.description.toString())
          ],
        );
      })
    );
  }
}
