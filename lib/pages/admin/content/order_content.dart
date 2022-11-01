import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';


class OderContent extends StatefulWidget {
  const OderContent({Key? key}) : super(key: key);

  @override
  State<OderContent> createState() => _OderContentState();
}

class _OderContentState extends State<OderContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomText(text: 'OderContent',color: TEXT_WHITE,),
    );
  }
}
