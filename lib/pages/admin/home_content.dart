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


List<String> _item = [
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
  ProductContent(),
  CategoryContent(),
  SettingsContent(),
  OderContent(),
  CustomerContent(),
  OverviewContent(),
  AddProduct(),
  AddCategory(),
];


class AdminHomeContent extends StatelessWidget {
  final String title;
  AdminHomeContent({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int itemIndex = _item.indexOf(title);

    print('------------------itme index : $itemIndex');
    if(itemIndex <0){
      var ff = title.split("/");
      print(ff);
      int ss = int.parse(ff.elementAt(ff.length-1));
      print(ss);
      return Container();
    }

    return itemIndex == -1 ? const NotFoundContent() : _contentWidget.elementAt(itemIndex);
  }
}
