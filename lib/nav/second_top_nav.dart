import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/nav/nav_item.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/category_drop_down_widget.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SecondTopNav extends StatefulWidget {
  const SecondTopNav({Key? key}) : super(key: key);

  @override
  State<SecondTopNav> createState() => _SecondTopNavState();
}

// List _categoryItems = [
//   'home',
//   'shop',
//   'shop detail',
//   'contact',
// ];

class _SecondTopNavState extends State<SecondTopNav> {

  var _selectedValue = null;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: commonPadding),
      margin: const EdgeInsets.all(0),
      width: screenSize.width,
      height: 80,
      decoration: const BoxDecoration(color: TOP_NAV_SECOND),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: const BoxDecoration(color: YELLOW),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: const[
                      Icon(
                          Icons.menu,
                          color: TOP_NAV_SECOND,
                          size: 28
                      ),
                      CategoryDropdownWidget(),
                    ],
                  )
                ),
                SizedBox(
                  width: screenSize.width * 0.05,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              GoRouter.of(context).goNamed(shippingPlaceOrderPage);
            },
            child: SizedBox(
              child: Row(
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    color: YELLOW,
                    size: 24,
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 0.8,
                        color: ITEM_WHITE.withOpacity(0.7),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const CustomText(
                      text: '0',
                      size: 12,
                      color: ITEM_WHITE,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nabItem(BuildContext context,
      {required String title, required VoidCallback onTap}) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              ? itemButtonController.onHover(title)
              : itemButtonController.onHover('/');
        },
        child: Obx(() {
          return Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: (itemButtonController.isHovering(title) ||
                      itemButtonController.isActive(title))
                  ? const Border(
                      bottom: BorderSide(width: 1.2, color: ITEM_HOVER),
                    )
                  : null,
            ),
            child: CustomText(
              text: title,
              size: 16,
              weight: FontWeight.w500,
              // color: Colors.white,
              color: (itemButtonController.isHovering(title) ||
                      itemButtonController.isActive(title))
                  ? YELLOW
                  : ITEM_WHITE,
            ),
          );
        }),
      ),
    );
  }
}
