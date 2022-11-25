

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectProductQuantityForBuy extends StatefulWidget {
  final String quantityTitle;
  const SelectProductQuantityForBuy({Key? key, this.quantityTitle='Quantity'}) : super(key: key);

  @override
  State<SelectProductQuantityForBuy> createState() => _SelectProductQuantityForBuyState();
}

class _SelectProductQuantityForBuyState extends State<SelectProductQuantityForBuy> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText(
          text: widget.quantityTitle,
          size: 16,
          color: TEXT_DARK.withOpacity(0.6),
          weight: FontWeight.w500,
        ),
        const SizedBox(
          width: 20,
        ),
        IconButton(
          onPressed: () {
            if(overallController.productQuantity.value>1){
              --overallController.productQuantity.value;
            }
          },
          icon: Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            child: Icon(
              Icons.minimize,
              size: 16,
              color: overallController.productQuantity.value == 1
                  ? TEXT_DARK
                  : TEXT_DARK.withOpacity(0.3),
            ),
          ),
        ),
        Container(
          width: 80,
          height: 40,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: TEXT_DARK.withOpacity(0.2),
          ),
          child: Obx((){
            return CustomText(text: '${overallController.productQuantity.value}',size: 16,color: TEXT_DARK,weight: FontWeight.w500,);
          }),
        ),
        InkWell(
          onTap: (){
            if(overallController.productQuantity.value<5){
              ++overallController.productQuantity.value;
            }
          },
          child: Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            child: const Icon(
              Icons.add,
              size: 16,
              color: TEXT_DARK,
            ),
          ),
        ),
      ],
    );
  }
}
