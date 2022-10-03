import 'package:flutter/material.dart';

class SmallScreenWidget extends StatelessWidget {
  const SmallScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.green,
    );
  }
}
