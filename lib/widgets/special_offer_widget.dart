import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SpecialOfferWidget extends StatelessWidget {
  const SpecialOfferWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 195,
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://cdn.pixabay.com/photo/2017/12/06/20/23/accessory-3002608__340.jpg"),
            fit: BoxFit.fill),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: TEXT_DARK.withOpacity(0.6),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: 'Save 20%',
                  color: TEXT_WHITE,
                  size: 16,
                  weight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomText(
                  text: 'Special Offer',
                  color: TEXT_WHITE,
                  size: 22,
                  weight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: 120,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 0),
                    borderRadius: BorderRadius.circular(4),
                    color: YELLOW,
                  ),
                  alignment: Alignment.center,
                  child: const CustomText(
                    text: 'Shop Now',
                    color: TEXT_WHITE,
                    size: 16,
                    weight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
