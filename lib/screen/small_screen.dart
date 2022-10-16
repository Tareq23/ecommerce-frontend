import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        padding: const EdgeInsets.all(0),
        child: const Center(child: CustomText(text: 'Small Screen Page',),),
      ),
    );
  }
}
