import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:flutter/material.dart';

class AdminLargeScreen extends StatefulWidget {
  final Widget child;
  const AdminLargeScreen({Key? key, required this.child}) : super(key: key);

  @override
  State<AdminLargeScreen> createState() => _AdminLargeScreenState();
}

class _AdminLargeScreenState extends State<AdminLargeScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      overallController.screenHeight.value = MediaQuery.of(context).size.height;
      overallController.screenWidth.value = MediaQuery.of(context).size.width;
    });
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ADMIN_BG_SEAL_BROWN,
        body: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
          decoration: const BoxDecoration(
            color: ADMIN_BG_SEAL_BROWN,
          ),
          child: SingleChildScrollView(
            child: widget.child,
          ),
        ));
  }
}
