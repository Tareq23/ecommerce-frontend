

import 'package:flutter/material.dart';

class LargeScreenWidget extends StatelessWidget {
  const LargeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.orange,
          ),
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
