import 'package:ecommercefrontend/pages/admin/content/category_content.dart';
import 'package:ecommercefrontend/pages/admin/content/customer_content.dart';
import 'package:ecommercefrontend/pages/admin/content/not_fount_content.dart';
import 'package:ecommercefrontend/pages/admin/content/order_content.dart';
import 'package:ecommercefrontend/pages/admin/content/overview_content.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/category/add_category.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/category/update_category.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/product/add_product.dart';
import 'package:ecommercefrontend/pages/admin/content/product_content.dart';
import 'package:ecommercefrontend/pages/admin/content/settings_content.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


List<String> contentItem = [
  'product',
  'category',
  'settings',
  'order',
  'customers',
  'overview',
  'add-new-product',
  'add-new-category',
];

List<Widget> _contentWidget = [
  AdminProductContentPage(),//0
  AdminCategoryContentPage(),//1
  SettingsContent(),//2
  OderContent(),//3
  CustomerContent(),//4
  OverviewContent(),//5
  AddProduct(),//6
  AddCategory(),//7
  UpdateCategory()//8
];


class AdminHomeContent extends StatelessWidget {
  final String title;
  AdminHomeContent({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int itemIndex = contentItem.indexOf(title);

    String route = GoRouter.of(context).location;
    print('route----------> ${route}');
    var ss = route.split("?");
    if(ss.length>1){
      var param = ss.elementAt(1).split("=");
      if(param[0].contains("update"))
      
      var url = ss.elementAt(0).split("/");
      var contentUrl = ss.elementAt(ss.length-1);
    }
    
    // print('------------------itme index : $itemIndex');
    // if(itemIndex <0){
    //   var ff = title.split("/");
    //   //print(ff);
    //   int ss = int.parse(ff.elementAt(ff.length-1));
    //   print(ss);
    //   return Container();
    // }
    return itemIndex == -1 ? const NotFoundContent() : _contentWidget.elementAt(itemIndex);
  }
}
