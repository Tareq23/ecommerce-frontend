import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/nav/admin/side_nav.dart';
import 'package:ecommercefrontend/pages/admin/content/not_fount_content.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/brand/add_new_brand.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/brand/update_brand.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/brand/view_all_brand.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/category/add_category.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/category/update_category.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/category/view_all_category.dart';
import 'package:flutter/material.dart';

List<String> _brandItem = ["add", "view", "update"];

List<Widget> _brandContentWidgetList = [
  const AddNewBrand(),
  const ViewAllBrand(),
  BrandUpdate(),
  const NotFoundContent(),
];

class AdminBrandContentPage extends StatefulWidget {
  final String title;
  const AdminBrandContentPage({Key? key, required this.title}) : super(key: key);

  @override
  State<AdminBrandContentPage> createState() => _AdminBrandContentPageState();
}

class _AdminBrandContentPageState extends State<AdminBrandContentPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        SideNav(),
        Expanded(
          child: Container(
            width: overallController.adminMainContentWidth.value,
            height: overallController.adminMainContentHeight.value,
            child: _brandContentWidgetList.elementAt(
                _brandItem.indexOf(widget.title!) == -1
                    ? 3
                    : _brandItem.indexOf(widget.title!)),
          ),
        ),
      ],
    );
  }
}
