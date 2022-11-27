import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/nav/nav_item.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

List<String> _itemList = [
  'overview',
  'product',
  'customer',
  'orders',
  'checkout',
  'settings',
];

List<String> _productSubItemList = ['add product', 'product list'];
List<String> _categorySubItemList = ['add category', 'category list'];
List<String> _brandSubItemList = ['add brand', 'brand list'];
List<String> _orderSubItemList = [
  'view',
  'payment complete',
  'payment pending',
  'new order'
];

class SideNav extends StatelessWidget {
  SideNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(width: 1.2, color: DIVIDER),
        ),
      ),
      constraints: BoxConstraints(
        minHeight: overallController.adminSideNavHeight.value,
        maxWidth: overallController.adminSideNavWidth.value,
      ),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 20, top: 20),
              child: NavItem(
                title: 'Home',
                textSize: 18,
                color: TEXT_WHITE,
                onTap: () {
                  context.go('/');
                },
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SideNavItem(
                    title: 'overview',
                    icon: Icons.menu_open_rounded,
                    onTap: () {
                      context.go('/admin/dashboard');
                    },
                  ),
                  _expandableAction('product', context, _productSubItemList),
                  _expandableAction('category', context, _categorySubItemList),
                  _expandableAction('brand', context, _brandSubItemList),
                  _expandableOrderAction('order', context, _orderSubItemList),
                  const SizedBox(
                    height: 20,
                  ),
                  SideNavItem(
                    title: 'settings',
                    icon: Icons.settings,
                    onTap: () {
                      context.go('/admin/dashboard/settings');
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SideNavItem(
                    title: 'My Account',
                    icon: Icons.person_sharp,
                    onTap: () {
                      context.go('/user/1/account');
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }

  Widget _expandableAction(
      String title, BuildContext context, List<String> list) {
    return ExpansionTile(
      iconColor: TEXT_WHITE,
      collapsedIconColor: TEXT_WHITE,
      childrenPadding: const EdgeInsets.all(0),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      tilePadding: const EdgeInsets.all(0),
      title: CustomText(
        text: title.toCapitalized(),
        size: 14,
        weight: FontWeight.w400,
        // color: Colors.white,
        color: TEXT_WHITE,
      ),
      children: [
        NavItem(
          title: list[0].toTitleCase(),
          onTap: () {
            // context.go('/admin/dashboard/product/add');
            context.go('/admin/dashboard/$title/add');
          },
          color: TEXT_WHITE,
          textSize: 14,
        ),
        const SizedBox(
          height: 15,
        ),
        NavItem(
          title: list[1].toTitleCase(),
          onTap: () {
            // context.go('/admin/dashboard/product');
            context.go('/admin/dashboard/$title');
          },
          color: TEXT_WHITE,
          textSize: 14,
        ),
      ],
    );
  }

  Widget _expandableOrderAction(
      String title, BuildContext context, List<String> list) {
    return ExpansionTile(
      iconColor: TEXT_WHITE,
      collapsedIconColor: TEXT_WHITE,
      childrenPadding: const EdgeInsets.all(0),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      tilePadding: const EdgeInsets.all(0),
      title: CustomText(
        text: title.toCapitalized(),
        size: 14,
        weight: FontWeight.w400,
        // color: Colors.white,
        color: TEXT_WHITE,
      ),
      children: [
        NavItem(
          title: 'All $title List',
          onTap: () {
            // context.go('/admin/dashboard/product/add');
            context.go('/admin/dashboard/$title');
          },
          color: TEXT_WHITE,
          textSize: 14,
        ),
        const SizedBox(
          height: 15,
        ),
        NavItem(
          title: list[1].toTitleCase(),
          onTap: () {
            // context.go('/admin/dashboard/product');
            context
                .go('/admin/dashboard/$title/${list[1].split(" ").join("/")}');
          },
          color: TEXT_WHITE,
          textSize: 14,
        ),
        const SizedBox(
          height: 15,
        ),
        NavItem(
          title: list[2].toTitleCase(),
          onTap: () {
            // context.go('/admin/dashboard/product');
            context
                .go('/admin/dashboard/$title/${list[2].split(" ").join("/")}');
          },
          color: TEXT_WHITE,
          textSize: 14,
        ),
        const SizedBox(
          height: 15,
        ),
        NavItem(
          title: list[3].toTitleCase(),
          onTap: () {
            // context.go('/admin/dashboard/product');
            context
                .go('/admin/dashboard/$title/${list[3].split(" ").join("-")}');
          },
          color: TEXT_WHITE,
          textSize: 14,
        ),
      ],
    );
  }
}

class SideNavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  const SideNavItem(
      {Key? key, required this.title, required this.onTap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("=================== top nav item $title");
    return Container(
      padding: const EdgeInsets.all(0),
      child: InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              ? itemButtonController.onHover(title)
              : itemButtonController.onHover('/');
        },
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: (itemButtonController.isHovering(title) ||
                        itemButtonController.isActive(title))
                    ? ITEM_HOVER
                    : TEXT_WHITE,
              ),
              const SizedBox(
                width: 17,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: (itemButtonController.isHovering(title) ||
                          itemButtonController.isActive(title))
                      ? const Border(
                          bottom: BorderSide(width: 1.2, color: ITEM_HOVER),
                        )
                      : null,
                ),
                child: CustomText(
                  text: title.toCapitalized(),
                  size: 14,
                  weight: FontWeight.w400,
                  // color: Colors.white,
                  color: (itemButtonController.isHovering(title) ||
                          itemButtonController.isActive(title))
                      ? ITEM_HOVER
                      : TEXT_WHITE,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
