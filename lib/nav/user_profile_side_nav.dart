import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/side_nav_model.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class UserAccountSideNav extends StatefulWidget {
  final double totalScreenWidth;
  const UserAccountSideNav({Key? key, required this.totalScreenWidth})
      : super(key: key);

  @override
  State<UserAccountSideNav> createState() => _UserAccountSideNavState();
}

List<String> _itemList = [
  'My Profile',
  'Address Book',
  'My Orders',
  'My Review',
];

List<UserAccountSideNavModel> _userAccountSideNavItemList = [
  UserAccountSideNavModel('My Profile', 'customerAccount'),
  UserAccountSideNavModel('Address Book', 'customerAccountAddress'),
  UserAccountSideNavModel('My Orders', 'customerAccountOrder'),
  UserAccountSideNavModel('My Review', 'customerAccountReview'),
];

class _UserAccountSideNavState extends State<UserAccountSideNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.totalScreenWidth * 0.2,
      padding: const EdgeInsets.only(left: 10,top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx((){
            return CustomText(
              text: overallController.customerInfo.value.name!,
              size: 16,
              color: TEXT_DARK.withOpacity(0.9),
            );
          }),
          const SizedBox(
            height: 10,
          ),
          ..._userAccountSideNavItemList.asMap().entries.map((item) {
            return Container(
              width: double.infinity,
              height: 30,
              margin: const EdgeInsets.only(bottom: 12),

              child: InkWell(
                onTap: (){
                 GoRouter.of(context).goNamed(item.value.urlNameParam!,params: {"id":"1"});
                },
                child: CustomText(
                  text: item.value.name!,
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
