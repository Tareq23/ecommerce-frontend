

import 'package:ecommercefrontend/helpers/responsiveness.dart';
import 'package:ecommercefrontend/widgets/large_screen.dart';
import 'package:ecommercefrontend/widgets/small_screen.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: ResponsiveWidget(largeScreen: const LargeScreenWidget(),smallScreen: const SmallScreenWidget(),),
    );
  }
}
