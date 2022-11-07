import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/nav/admin/side_nav.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';


class AdminProductContentPage extends StatefulWidget {
  const AdminProductContentPage({Key? key}) : super(key: key);

  @override
  State<AdminProductContentPage> createState() => _AdminProductContentPageState();
}

class _AdminProductContentPageState extends State<AdminProductContentPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        SideNav(),
        // Expanded(child: ,),
      ],
    );
  }
}
