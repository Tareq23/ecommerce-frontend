import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/nav/admin/side_nav.dart';
import 'package:ecommercefrontend/pages/admin/content/not_fount_content.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/category/add_category.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/product/add_product.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/product/product_details.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/product/update_product.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/product/view_all_product.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';



List<String> _productItem = ["add", "view", "update","details"];

List<Widget> _productContentWidgetList = [
  const AddProduct(),
  const ViewAllProduct(),
  UpdateProduct(),
  const AdminProductDetails(),
  const NotFoundContent(),
];

class AdminProductContentPage extends StatefulWidget {
  String? title;
  AdminProductContentPage({Key? key,this.title}) : super(key: key);

  @override
  State<AdminProductContentPage> createState() => _AdminProductContentPageState();
}

class _AdminProductContentPageState extends State<AdminProductContentPage> {
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
            child: _productContentWidgetList.elementAt(
                !_productItem.contains(widget.title!)
                    ? 3
                    : _productItem.indexOf(widget.title!)),
          ),
        ),
      ],
    );
  }
}
