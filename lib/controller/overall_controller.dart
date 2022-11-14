import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:html' as html;

class OverallController extends GetxController {
  static OverallController instance = Get.find();
  var screenWidth = 0.0.obs;
  var screenHeight = 0.0.obs;
  var currentWidgetWidth = 0.0.obs;
  var currentWidgetHeight = 0.0.obs;
  var activeWidgetIndex = 0.obs;

  var adminSideNavWidth = 0.0.obs;
  var adminSideNavHeight = 0.0.obs;
  var adminMainContentWidth = 0.0.obs;
  var adminMainContentHeight = 0.0.obs;

  var selectedImagePath = ''.obs;

  var selectedCategoryId = 0.obs;
}
