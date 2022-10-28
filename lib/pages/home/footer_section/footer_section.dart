import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/nav/nav_item.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class FooterSection extends StatelessWidget {
  final double height;
  FooterSection({Key? key, required this.height}) : super(key: key);

  double width = (overallController.screenWidth.value - commonPadding * 2);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        width = (overallController.screenWidth.value - commonPadding * 2);
        return Container(
          width: overallController.screenWidth.value,
          padding: EdgeInsets.only(
              left: commonPadding,
              right: commonPadding,
              top: commonPadding * 0.5,
              bottom: commonPadding * 0.3),
          color: FOOTER_BACKGROUND_COLOR,
          alignment: Alignment.centerLeft,
          height: height,
          child: Row(
            children: [
              FooterFirstSection(width: width * 0.3),
              FooterSecondSection(width: width * 0.2),
              FooterThirdSection(width: width * 0.2),
              FooterFourthSection(width: width * 0.3),
            ],
          ),
        );
      },
    );
  }
}

class FooterFirstSection extends StatelessWidget {
  final double width;
  const FooterFirstSection({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: width,
      // color: Colors.green,
      padding: const EdgeInsets.only(right: 16),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'GET IN TOUCH',
            size: 18,
            weight: FontWeight.w700,
            color: TEXT_WHITE,
          ),
          const SizedBox(
            height: 28,
          ),
          CustomText(
            text: "Lorem ipsum is a pseudo-Latin text used in web design, "
                "typography, layout, and printing in "
                "place of English to emphasise design elements over content. ",
            size: 16,
            weight: FontWeight.w400,
            color: TEXT_WHITE,
          ),
          const SizedBox(
            height: 65,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.location_on_sharp,
                size: 26,
                color: YELLOW,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomText(
                  text: 'Address -> English to emphasise design elements',
                  size: 16,
                  color: TEXT_WHITE,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(
                Icons.email,
                size: 26,
                color: YELLOW,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomText(
                  text: 'mail@example.com',
                  size: 14,
                  color: TEXT_WHITE,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(
                Icons.phone,
                size: 26,
                color: YELLOW,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomText(
                  text: '+88017321111',
                  size: 14,
                  color: TEXT_WHITE,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FooterSecondSection extends StatelessWidget {
  final double width;
  const FooterSecondSection({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: width,
      color: Colors.transparent,
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'GET IN TOUCH',
            size: 18,
            weight: FontWeight.w700,
            color: TEXT_WHITE,
          ),
          const SizedBox(
            height: 28,
          ),
          item(context, 'home'),
          const SizedBox(
            height: 12,
          ),
          item(context, 'our shop'),
          const SizedBox(
            height: 12,
          ),
          item(context, 'shop details'),
          const SizedBox(
            height: 12,
          ),
          item(context, 'shoping cart'),
          const SizedBox(
            height: 12,
          ),
          item(context, 'checkout'),
          const SizedBox(
            height: 12,
          ),
          item(context, 'contact us'),
        ],
      ),
    );
  }
}

Widget item(BuildContext context, String title) {
  // final String title;
  return Row(
    children: [
      Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14,
        color: TEXT_WHITE,
      ),
      const SizedBox(
        width: 8,
      ),
      NavItem(
        title: title.toUpperCase(),
        color: TEXT_WHITE,
        onTap: () {
          if (!itemButtonController.isActive(title)) {
            itemButtonController.changeActiveItemTo(title);
            context.go('/${title.toLowerCase()}');
          }
        },
      ),
    ],
  );
}

class FooterThirdSection extends StatelessWidget {
  final double width;
  const FooterThirdSection({Key? key, required this.width}) : super(key: key);

  @override
  build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: width,
      color: Colors.transparent,
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'MY ACCOUNT',
            size: 18,
            weight: FontWeight.w700,
            color: TEXT_WHITE,
          ),
          const SizedBox(
            height: 28,
          ),
          item(context, 'address'),
          const SizedBox(
            height: 12,
          ),
          item(context, 'all order'),
        ],
      ),
    );
  }
}

class FooterFourthSection extends StatelessWidget {
  final double width;
  const FooterFourthSection({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: width,
      color: Colors.transparent,
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'NEWSLETTER',
            size: 18,
            weight: FontWeight.w700,
            color: TEXT_WHITE,
          ),
          const SizedBox(
            height: 28,
          ),
          const CustomText(
            text: 'Lorem ipsum is a pseudo-Latin text used in web design',
            size: 16,
            weight: FontWeight.w500,
            color: TEXT_WHITE,
          ),
          const SizedBox(
            height: 28,
          ),
          Container(
            padding: const EdgeInsets.all(0),
            width: double.infinity,
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: TEXT_WHITE.withOpacity(0.8),fontSize: 18,fontWeight: FontWeight.w500),
                      hintText: 'Email Address',
                      focusedBorder: _emailBorder(context),
                      border: _emailBorder(context),
                      enabledBorder: _emailBorder(context),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0,
                          color: YELLOW,
                        ),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(2),
                          bottomRight: Radius.circular(2),
                        ),
                        color: YELLOW,
                      ),
                      alignment: Alignment.center,
                      child: CustomText(
                        text: 'Sign Up',
                        size: 18,
                        weight: FontWeight.w600,
                        color: TEXT_DARK.withOpacity(0.7),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _emailBorder(BuildContext context) {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(2),
        bottomLeft: Radius.circular(2),
      ),
      borderSide: BorderSide(width: 1.2, color: YELLOW),
    );
  }
}
