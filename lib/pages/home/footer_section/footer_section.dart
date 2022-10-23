import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          const SizedBox(height: 28,),
          CustomText(
            text: "Lorem ipsum is a pseudo-Latin text used in web design, "
                "typography, layout, and printing in "
                "place of English to emphasise design elements over content. ",
            size: 16,
            weight: FontWeight.w400,
            color: TEXT_WHITE,
          ),
          const SizedBox(height: 65,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.location_on_sharp,size: 26,color: YELLOW,),
              const SizedBox(width: 20,),
              Expanded(child: CustomText(text: 'Address -> English to emphasise design elements',size: 16,color: TEXT_WHITE,),),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            children: [
              Icon(Icons.email,size: 26,color: YELLOW,),
              const SizedBox(width: 20,),
              Expanded(child: CustomText(text: 'mail@example.com',size: 14,color: TEXT_WHITE,),),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            children: [
              Icon(Icons.phone,size: 26,color: YELLOW,),
              const SizedBox(width: 20,),
              Expanded(child: CustomText(text: '+88017321111',size: 14,color: TEXT_WHITE,),),
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
      color: Colors.red,
    );
  }
}

class FooterThirdSection extends StatelessWidget {
  final double width;
  const FooterThirdSection({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: width,
      color: Colors.orangeAccent,
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
      color: Colors.yellowAccent,
    );
  }
}
