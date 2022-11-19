
import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/brand_model.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SelectedCategoriesNav extends StatefulWidget {
  final double width;
  const SelectedCategoriesNav({Key? key,required this.width}) : super(key: key);

  @override
  State<SelectedCategoriesNav> createState() => _SelectedCategoriesNavState();
}

class _SelectedCategoriesNavState extends State<SelectedCategoriesNav> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.only(left: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(text: 'Category',size: 18,weight: FontWeight.w600,color: TEXT_DARK,),
          const SizedBox(height: 5,),
          CustomText(text: overallController.selectedCategoryName.value,size: 14,color: TEXT_RED,weight: FontWeight.w600,),
          const SizedBox(height: 40,),
          const CustomText(text: 'Brand',size: 18,weight: FontWeight.w600,color: TEXT_DARK,),
          const SizedBox(height: 20,),
          ...brandList.asMap().entries.map((e){
            return SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(value: e.value.isSelected, onChanged: (value){
                    setState(() {
                      e.value.isSelected = value;
                    });
                  }),
                  const SizedBox(width: 8,),
                  CustomText(text: e.value.name.toString(),size: 16,weight: FontWeight.w400,)
                ],
              ),
            );
          }),
        ],
      )
    );
  }
}
