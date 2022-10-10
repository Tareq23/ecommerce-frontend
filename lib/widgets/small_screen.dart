import 'package:ecommercefrontend/helpers/local_navigator.dart';
import 'package:flutter/material.dart';

class SmallScreenWidget extends StatelessWidget {
  const SmallScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return localNavigator();
  }
}
