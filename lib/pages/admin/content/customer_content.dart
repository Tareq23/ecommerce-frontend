import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';


class CustomerContent extends StatefulWidget {
  const CustomerContent({Key? key}) : super(key: key);

  @override
  State<CustomerContent> createState() => _CustomerContentState();
}

class _CustomerContentState extends State<CustomerContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomText(text: 'CustomerContent',color: TEXT_WHITE,),
    );
  }
}
