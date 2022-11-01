

import 'package:ecommercefrontend/nav/admin/side_nav.dart';
import 'package:ecommercefrontend/pages/admin/home_content.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  final String title;
  const AdminHome({Key? key, required this.title}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SideNav(),
            AdminHomeContent(title: widget.title,),
          ],
        ),
      ],
    );
  }
}
