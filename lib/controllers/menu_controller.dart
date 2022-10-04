

import 'package:ecommercefrontend/constants/style.dart';
import 'package:ecommercefrontend/routing/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MenuController extends GetxController
{
  static MenuController instance = Get.find();
  var activeItem = OverviewPageRoute.obs;
  var hoberItem = "".obs;

  changeActiveItemTo(String itemName)
  {
    activeItem.value = itemName;
  }

  onHover(String itemName){
    if(!isActive(itemName)){
      hoberItem.value = itemName;
    }
  }
  isActive(String itemName) => activeItem.value == itemName;
  isHobering(String itemName) => hoberItem.value == itemName;


  Widget returnIconFor(String itemName)
  {
    switch(itemName){
      case OverviewPageRoute:
        return _customIcon(Icons.trending_up, itemName);
      case DividersPageRoute:
        return _customIcon(Icons.drive_eta, itemName);
      case ClientsPageRoute:
        return _customIcon(Icons.people_alt_outlined, itemName);
      case AuthenticationPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon,String itemName)
  {
    if(isActive(itemName)){
      return Icon(icon,size: 22,color: dark,);
    }
    return Icon(icon,color: isHobering(itemName) ? dark : lightGrey,);
  }
}