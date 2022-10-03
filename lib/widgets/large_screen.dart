

import 'package:flutter/material.dart';

class LargeScreenWidget extends StatelessWidget {
  const LargeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.orange,
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}
