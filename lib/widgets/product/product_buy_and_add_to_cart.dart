import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductBuyAndCartButtonWidget extends StatelessWidget {
  const ProductBuyAndCartButtonWidget({Key? key}) : super(key: key);

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
            onTap: () {
              GoRouter.of(context).goNamed(shippingPlaceOrderPage);
              // print('buy know--------------> ');
            },
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
