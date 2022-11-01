import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';


class ProductContent extends StatefulWidget {
  const ProductContent({Key? key}) : super(key: key);

  @override
  State<ProductContent> createState() => _ProductContentState();
}

class _ProductContentState extends State<ProductContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomText(text: 'ProductContent',color: TEXT_WHITE,),
    );
  }
}
