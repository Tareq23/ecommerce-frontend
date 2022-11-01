import 'package:ecommercefrontend/pages/admin/content/category_content.dart';
import 'package:ecommercefrontend/pages/admin/content/customer_content.dart';
import 'package:ecommercefrontend/pages/admin/content/not_fount_content.dart';
import 'package:ecommercefrontend/pages/admin/content/order_content.dart';
import 'package:ecommercefrontend/pages/admin/content/overview_content.dart';
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
];

List<Widget> _contentWidget = [
  ProductContent(),
  CategoryContent(),
  SettingsContent(),
  OderContent(),
  CustomerContent(),
  OverviewContent(),
];


class AdminHomeContent extends StatelessWidget {
  final String title;
  const AdminHomeContent({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int itemIndex = _item.indexOf(title);
    return itemIndex == -1 ? const NotFoundContent() : _contentWidget.elementAt(itemIndex);
  }
}
