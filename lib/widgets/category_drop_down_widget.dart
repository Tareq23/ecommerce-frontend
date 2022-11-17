

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';


List<String> _categoryItems = [
  'Categories',
];

List<int> _categoryIndex = [
  0,
];


class CategoryDropdownWidget extends StatefulWidget {
  const CategoryDropdownWidget({Key? key}) : super(key: key);

  @override
  State<CategoryDropdownWidget> createState() => _CategoryDropdownWidgetState();
}

class _CategoryDropdownWidgetState extends State<CategoryDropdownWidget> {
  var _selectedValue = _categoryItems[0];

  bool _checkCategory = false;

  @override
  void didChangeDependencies() async{
    if(!_checkCategory){
      if(_categoryItems.length>1){
        _categoryItems.clear();
        _categoryIndex.clear();
        _categoryIndex.add(0);
        _categoryItems.add('Categories');
      }
      await categoryController.fetchCategory();
      for(int i=0; i<categoryController.categoryList.length; i++){
        if(categoryController.categoryList[i].name!.contains("useless")){
          continue;
        }
        _categoryItems.add(categoryController.categoryList[i].name!.toCapitalized());
        _categoryIndex.add(categoryController.categoryList[i].id!);
      }

      setState(() {
        _checkCategory = true;
        _selectedValue = _categoryItems[0];
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      alignment: Alignment.center,
      value: null,
      icon: const SizedBox.shrink(),
      isDense:true,
      underline: const SizedBox.shrink(),
      hint: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(text: _selectedValue,size: 18,weight: FontWeight.w500,color: TEXT_DARK.withOpacity(0.8),),
          const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: TOP_NAV_SECOND,
            size: 26,
          )
        ],
      ),
      items: _categoryItems
          .map(
            (e) => DropdownMenuItem<String>(
          value: e,
          child: CustomText(
            text: e.toString(),
            size: 18,weight: FontWeight.w500,color: TEXT_DARK.withOpacity(0.8),
          ),
        ),
      )
          .toList(),
      onChanged: (newValue) {
        overallController.selectedCategoryId.value = _categoryIndex.elementAt(_categoryItems.indexOf(newValue!));
        setState(() {
          _selectedValue = newValue;
        });
        print('slected category id ${overallController.selectedCategoryId.value}');
      },
    );
  }
}
