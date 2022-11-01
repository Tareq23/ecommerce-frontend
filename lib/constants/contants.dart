


import 'package:ecommercefrontend/constants/controllers.dart';

const double largeScreenSize = 1080;
const double mediumScreenSize = 768;
const double smallScreenSize = 360;
const double borderRadius = 12;


double commonPadding = overallController.screenWidth.value * 0.07;


extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}