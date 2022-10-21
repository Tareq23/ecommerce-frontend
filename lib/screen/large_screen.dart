import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/nav/top_nav.dart';
import 'package:ecommercefrontend/widgets/about_us_widget.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/common_widgets.dart';
import '../widgets/contact_widget.dart';
import '../widgets/help_widget.dart';
import '../widgets/home_widget.dart';
import '../widgets/login_widget.dart';
import '../widgets/register_widget.dart';

class LargeScreen extends StatefulWidget {
  final String title;
  LargeScreen({required this.title});
  @override
  State<LargeScreen> createState() => _LargeScreenState();
}
// List<String> _page = ['home', 'about', 'help', 'settings'];
class _LargeScreenState extends State<LargeScreen> {
  @override
  Widget build(BuildContext context) {
    print("==========================> Large Screen");
    overallController.currentWidgetWidth.value = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopNav(),
              homePageWidgetList.elementAt(homePageTopNavItemName.indexOf(widget.title),),
            ],
          ),
        ),
      ),
    );
  }
}
