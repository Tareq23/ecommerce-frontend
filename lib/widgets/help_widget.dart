

import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HelpWidget extends StatelessWidget {
  const HelpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        text: "Help",
      ),
    );
  }
}
