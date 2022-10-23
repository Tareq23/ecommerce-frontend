import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: commonPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ServiceCard(
            height: 80,
            title: 'Quality Product',
            icon: Icons.fork_right,
          ),
          _ServiceCard(
            height: 80,
            title: 'Free Shipping',
            icon: Icons.local_shipping_outlined,
          ),
          _ServiceCard(
            height: 80,
            title: '24/7 Support',
            icon: Icons.fork_right,
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final double height;
  final double? width;
  final String title;
  final IconData icon;
  const _ServiceCard(
      {Key? key,
      required this.title,
      required this.height,
      this.width,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 250,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: YELLOW,
            size: 32,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: CustomText(
              text: title,
              size: 18,
              color: TEXT_DARK,
              weight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
