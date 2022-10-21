import 'package:get/get.dart';

class ItemButtonController extends GetxController
{
  static ItemButtonController instance = Get.find();

  var activeItem = "/".obs;
  var hoverItem = "".obs;


  changeActiveItemTo(String itemName)
  {
    activeItem.value = itemName;
  }

  onHover(String itemName){
    if(!isActive(itemName)){
      hoverItem.value = itemName;
    }
  }

  isActive(String itemName) => activeItem.value == itemName;
  isHovering(String itemName) => hoverItem.value == itemName;

}