

import 'package:ecommercefrontend/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class LargeScreenWidget extends StatelessWidget {
  const LargeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SideMenu()
        ),
        Expanded(
          flex: 5,
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}
