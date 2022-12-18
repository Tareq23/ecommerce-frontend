

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


List<String> _categoryItemsName = [
  'Categories',
];

List<String> _categoryItemSlug = [
  'categories',
];
List<String> _categoryItemAgainSlug = [
  'categories',
];

List<int> _categoryItemIndex = [
  0,
];


class CategoryDropdownWidget extends StatefulWidget {
  const CategoryDropdownWidget({Key? key}) : super(key: key);

  @override
  State<CategoryDropdownWidget> createState() => _CategoryDropdownWidgetState();

  static Future<void> categoryProcess({String? slug, bool isRequiredId=false}) async{
    await categoryController.fetchCategory();
    for(int i=0; i<categoryController.categoryList.length; i++){
      if(categoryController.categoryList[i].name!.contains("useless")){
        continue;
      }
      _categoryItemsName.add(categoryController.categoryList[i].name!.toCapitalized());
      _categoryItemSlug.add(categoryController.categoryList[i].name!.toLowerCase().split(' ').join('-'));
      _categoryItemAgainSlug.add(categoryController.categoryList[i].name!.toLowerCase().split(' & ').join('-'));
      _categoryItemIndex.add(categoryController.categoryList[i].id!);
      // print('cat slug : ${categoryController.categoryList[i].name!.toLowerCase().split(' ').join('-')}');
    }

    if(isRequiredId){
      var slugIndex = _categoryItemSlug.indexOf(slug!);
      bool againCheck = false;
      if(slugIndex == -1){
        againCheck = true;
        slugIndex = _categoryItemAgainSlug.indexOf(slug.split('-%26-').join('-'));
        print('slugIndex =  ${slug.split('%26').join('-')} _categoryItemAgainSlug.indexOf(slug.split("%24").join("-")); $slug $slugIndex');
      }
      if(againCheck){
        overallController.selectedCategoryId.value = _categoryItemIndex.elementAt(slugIndex == -1 ? 0 : slugIndex);
        overallController.selectedCategoryName.value = _categoryItemsName.elementAt(slugIndex == -1 ? 0 : slugIndex);
      }
      overallController.selectedCategoryId.value = _categoryItemIndex.elementAt(slugIndex == -1 ? 0 : slugIndex);
      overallController.selectedCategoryName.value = _categoryItemsName.elementAt(slugIndex == -1 ? 0 : slugIndex);
    }
  }

}

class _CategoryDropdownWidgetState extends State<CategoryDropdownWidget> {
  // var _selectedValue = _categoryItemsName[0];



  @override
  void didChangeDependencies() async{
    if(!overallController.isDidChangeDependencies.value){

    }
    if(_categoryItemsName.length<2){
      overallController.selectedCategoryName.value = _categoryItemsName[0];
      await CategoryDropdownWidget.categoryProcess(isRequiredId: false);
    }
    overallController.isDidChangeDependencies.value = true;

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
          CustomText(text: overallController.selectedCategoryName.value,size: 18,weight: FontWeight.w500,color: TEXT_DARK.withOpacity(0.8),),
          const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: TOP_NAV_SECOND,
            size: 26,
          )
        ],
      ),
      items: _categoryItemsName
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
        overallController.selectedCategoryId.value = _categoryItemIndex.elementAt(_categoryItemsName.indexOf(newValue!));
        if(overallController.selectedCategoryName.value.contains(newValue)){
          return ;
        }
        overallController.selectedCategoryName.value = newValue;
        if(overallController.selectedCategoryId.value == 0){
          GoRouter.of(context).goNamed(root);
        }else{
          // // 'category?name=:name',
          // // GoRouter.of(context).go('category/${overallController.selectedCategoryId.value}/products');
          // var catSlug  = _selectedValue.toLowerCase().split(' ').join("-");
          // print('slected category id ${overallController.selectedCategoryId.value} slug : ${_selectedValue.toLowerCase().split(' ').join("-")}');
          overallController.isDidChangeDependencies.value = false;
          GoRouter.of(context).pushNamed(specificCategoryProducts,params: {"name":overallController.selectedCategoryName.value.toLowerCase().split(' ').join("-")});
        }
      },
    );
  }
}
