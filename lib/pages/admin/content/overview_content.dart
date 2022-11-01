import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';


class OverviewContent extends StatefulWidget {
  const OverviewContent({Key? key}) : super(key: key);

  @override
  State<OverviewContent> createState() => _OverviewContentState();
}

class _OverviewContentState extends State<OverviewContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomText(text: 'OverviewContent',color: TEXT_WHITE,),
    );
  }
}
