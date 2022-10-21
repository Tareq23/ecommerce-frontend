import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CustomText(
          text: 'Home Widget',
        ),
      ),
    );
  }
}
