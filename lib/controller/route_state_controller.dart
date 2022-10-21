

import 'package:get/get.dart';

class StateController extends GetxController
{

  static StateController instance = Get.find();

  var currentRoutestate = '/'.obs;

}