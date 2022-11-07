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

class SideNav extends StatelessWidget {
  SideNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
          border: Border(
        right: BorderSide(width: 1.2, color: DIVIDER),
      ),),
      constraints: BoxConstraints(
        minHeight: overallController.adminSideNavHeight.value,
        maxWidth: overallController.adminSideNavWidth.value,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20,top: 20),
            child: NavItem(
              title: 'Home',
              textSize: 18,
              color: TEXT_WHITE,
              onTap: (){
                context.go('/');
              },
            )
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SideNavItem(title: 'overview',icon: Icons.menu_open_rounded,onTap: (){
                    context.go('/admin/dashboard/overview');
                  },),
                  _expandableProductAction('products',context),
                  _expandableCategoryAction('category',context),
                  SideNavItem(title: 'order',icon: Icons.shopping_bag,onTap: (){
                    context.go('/admin/dashboard/order');
                  },),
                  const SizedBox(height: 20,),
                  SideNavItem(title: 'settings',icon: Icons.settings,onTap: (){
                    context.go('/admin/dashboard/settings');
                  },),
                ],
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }

  Widget _expandableProductAction(String title,BuildContext context) {
    return ExpansionTile(
      iconColor: TEXT_WHITE,
      collapsedIconColor: TEXT_WHITE,
      childrenPadding: const EdgeInsets.all(0),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      tilePadding: const EdgeInsets.all(0),
      title: SideNavItem(title: title,icon: Icons.add,onTap: (){
        context.go(
          context.namedLocation(adminProductContentPage),
        );
      },),
      children: [
        NavItem(
          title: 'add new product'.toTitleCase(),
          onTap: () {
            context.go('/admin/dashboard/product/add-new-product');
          },
          color: TEXT_WHITE,
          textSize: 14,
        ),
        const SizedBox(
          height: 15,
        ),
        NavItem(
          title: 'update product'.toTitleCase(),
          onTap: () {},
          color: TEXT_WHITE,
          textSize: 14,
        ),
        const SizedBox(
          height: 15,
        ),
        NavItem(
          title: 'delete product'.toTitleCase(),
          onTap: () {},
          color: TEXT_WHITE,
          textSize: 14,
        ),
      ],
    );
  }

  Widget _expandableCategoryAction(String title,BuildContext context) {
    return ExpansionTile(
      iconColor: TEXT_WHITE,
      collapsedIconColor: TEXT_WHITE,
      childrenPadding: const EdgeInsets.only(left: 12),
      tilePadding: const EdgeInsets.all(0),
      title: SideNavItem(title: title,icon: Icons.add,onTap: (){
        context.go('/admin/dashboard/category');
      },),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NavItem(
          title: 'add category'.toTitleCase(),
          onTap: () {
            context.go('/admin/dashboard/category/add');
          },
          color: TEXT_WHITE,
          textSize: 14,
        ),
        const SizedBox(
          height: 15,
        ),
        NavItem(
          title: 'delete category'.toTitleCase(),
          onTap: () {},
          color: TEXT_WHITE,
          textSize: 14,
        ),
        const SizedBox(
          height: 15,
        ),
        NavItem(
          title: 'update category'.toTitleCase(),
          onTap: () {},
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
              const SizedBox(width: 17,),
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
