import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';


class CategoryContent extends StatefulWidget {
  const CategoryContent({Key? key}) : super(key: key);

  @override
  State<CategoryContent> createState() => _CategoryContentState();
}

class _CategoryContentState extends State<CategoryContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomText(text: '_CategoryContent',color: TEXT_WHITE,),
    );
  }
}
