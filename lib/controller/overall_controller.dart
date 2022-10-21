

import 'package:get/get.dart';

class OverallController extends GetxController
{
  static OverallController instance = Get.find();
  var screenWidth = 0.0.obs;
  var screenHeight = 0.0.obs;
  var currentWidgetWidth = 0.0.obs;
  var currentWidgetHeight = 0.0.obs;
  var activeWidgetIndex = 0.obs;
}