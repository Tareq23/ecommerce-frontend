import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/widgets/text_field.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
      constraints: BoxConstraints(
        maxWidth: overallController.adminMainContentWidth.value,
        maxHeight: overallController.adminMainContentHeight.value,
        minWidth: overallController.adminMainContentWidth.value,
        minHeight: overallController.adminMainContentHeight.value,
      ),
      // width: overallController.adminMainContentWidth.value,
      // height: overallController.adminMainContentHeight.value,
      child: Form(
        child: Column(
          children: [
            // TextFieldWidget(hint: 'product name',),
          ],
        ),
      ),
    );
  }
}
