import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/nav/admin/side_nav.dart';
import 'package:ecommercefrontend/pages/admin/content/not_fount_content.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/order/order_details.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/order/delivered_order.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/order/confirm_order.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/order/view_all_new_order.dart';
import 'package:ecommercefrontend/pages/admin/content/pages/order/view_all_order.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';


List<String> _orderItem = ['view','payment/complete','payment/pending','new-order','details'];

List<Widget> _orderContentWidgetList = [
  ViewAllOrder(),
  ViewDeliveredOder(),
  ViewConfirmOrder(),
  ViewAllNewOrder(),
  OrderDetails(),
  NotFoundContent()
];

class AdminOderContentPage extends StatefulWidget {
  final String title;
  const AdminOderContentPage({Key? key, required this.title}) : super(key: key);

  @override
  State<AdminOderContentPage> createState() => _AdminOderContentPageState();
}

class _AdminOderContentPageState extends State<AdminOderContentPage> {
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
            child: _orderContentWidgetList.elementAt(
                !_orderItem.contains(widget.title)
                    ? 5
                    : _orderItem.indexOf(widget.title)),
          ),
        ),
      ],
    );
  }
}
