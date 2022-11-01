import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:flutter/material.dart';


class LargeScreen extends StatefulWidget {
  final String title;
  final Widget child;
  const LargeScreen({required this.title,required this.child});
  @override
  State<LargeScreen> createState() => _LargeScreenState();
}
// List<String> _page = ['home', 'about', 'help', 'settings'];
class _LargeScreenState extends State<LargeScreen> {
  @override
  Widget build(BuildContext context) {
    overallController.currentWidgetWidth.value = MediaQuery.of(context).size.width;
    // var homePageContentIndex = !homePageTopNavItemName.contains(widget.title)
    //     ? homePageTopNavItemName.length-1 : homePageTopNavItemName.indexOf(widget.title);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: widget.child,
        ),
      ),
    );
  }
}
