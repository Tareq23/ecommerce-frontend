import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/nav/admin/side_nav.dart';
import 'package:ecommercefrontend/pages/admin/content/not_fount_content.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/category/add_category.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/category/update_category.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/category/view_all_category.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<String> _categoryItem = ["add", "view", "update"];

List<Widget> _categoryContentWidgetList = [
  const AddCategory(),
  const ViewAllCategory(),
  UpdateCategory(),
  const NotFoundContent(),
];

class AdminCategoryContentPage extends StatefulWidget {
  String? title;
  AdminCategoryContentPage({Key? key, this.title}) : super(key: key);
  @override
  State<AdminCategoryContentPage> createState() =>
      _AdminCategoryContentPageState();
}

class _AdminCategoryContentPageState extends State<AdminCategoryContentPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await categoryController.fetchCategory();
      print(
          'admin category content => ${categoryController.categoryList.length}');
    });
    super.initState();
  }

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
            child: _categoryContentWidgetList.elementAt(
                _categoryItem.indexOf(widget.title!) == -1
                    ? 3
                    : _categoryItem.indexOf(widget.title!)),
          ),
        ),
      ],
    );
  }
}
