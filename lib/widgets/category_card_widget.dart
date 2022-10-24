

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/category_model.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  CategoryCard({Key? key, required this.category}) : super(key: key);
  static double _width=0;
  double _cardHeight = 150;
  @override
  Widget build(BuildContext context) {
    return Obx((){
      _width = (overallController.screenWidth.value - commonPadding * 2);
      _width = _width - (_width* 0.02);
      return Link(
        uri:Uri.parse('/category/${category.id}/products'),
        target: LinkTarget.self,
        builder:(context,followLink){
          return InkWell(
            onTap: followLink,
            child: Container(
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
            ),
          );
        }
      );
    });
  }
}