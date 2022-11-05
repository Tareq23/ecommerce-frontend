

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/nav/admin/side_nav.dart';
import 'package:ecommercefrontend/pages/admin/home_content.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminHome extends StatefulWidget {
  final String title;
  String? subTitle;
  AdminHome({Key? key, required this.title,this.subTitle}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(!authenticationController.userLogin.value.isAdmin!){
      context.go('/');
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        SideNav(),
        Expanded(child: AdminHomeContent(title: widget.title),),
      ],
    );
  }
}
