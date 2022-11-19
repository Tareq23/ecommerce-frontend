import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProductBuyAndCartButtonWidget extends StatefulWidget {
  const ProductBuyAndCartButtonWidget({Key? key}) : super(key: key);

  @override
  State<ProductBuyAndCartButtonWidget> createState() => _ProductBuyAndCartButtonWidgetState();
}

class _ProductBuyAndCartButtonWidgetState extends State<ProductBuyAndCartButtonWidget> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width - 2 * commonPadding;
    return SizedBox(
      width: (width * 0.5) - 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: ((width * 0.5) - 20) * 0.4,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: BUTTON_BLUE,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const CustomText(
                text: 'Buy Now',
                size: 18,
                weight: FontWeight.w500,
                color: TEXT_WHITE,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: ((width * 0.5) - 20) * 0.4,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: YELLOW,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const CustomText(
                text: 'Add To Cart',
                size: 18,
                weight: FontWeight.w500,
                color: TEXT_WHITE,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
