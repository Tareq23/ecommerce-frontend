import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/style.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const HorizontalMenuItem({Key? key, required this.itemName, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      onHover: (value){
        value ? menuController.onHover(itemName) : menuController.onHover("not hobering");
      },
      child: Obx(()=>Container(
        color: menuController.isHovering(itemName) ? lightGrey.withOpacity(0.1) : Colors.transparent,
        child: Row(
          children: [
            Visibility(
              visible: menuController.isHovering(itemName) || menuController.isActive(itemName),
              child: Container(
                width: 6,
                height: 40,
                color: dark,
              ),
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
            ),
            SizedBox(width: _width/80,),
            Padding(
              padding: const EdgeInsets.all(16),
              child: menuController.returnIconFor(itemName),
            ),
            if(!menuController.isActive(itemName))
              Flexible(child: CustomText(text: itemName,color: menuController.isHovering(itemName)?dark : lightGrey,)),
            if(menuController.isActive(itemName))
              Flexible(child: CustomText(text: itemName,color: dark,size: 18,weight: FontWeight.bold,)),
          ],
        ),
      )),
    );
  }
}
