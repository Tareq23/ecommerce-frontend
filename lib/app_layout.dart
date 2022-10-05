

import 'package:ecommercefrontend/helpers/responsiveness.dart';
import 'package:ecommercefrontend/widgets/large_screen.dart';
import 'package:ecommercefrontend/widgets/side_menu.dart';
import 'package:ecommercefrontend/widgets/small_screen.dart';
import 'package:ecommercefrontend/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  AppLayout({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: const Drawer(child: SideMenu(),),
      appBar: topNavigationBar(context, globalKey),
      body: ResponsiveWidget(largeScreen: const LargeScreenWidget(),smallScreen: const SmallScreenWidget(),),
    );
  }
}
