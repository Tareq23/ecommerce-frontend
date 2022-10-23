import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/nav/nav_search.dart';
import 'package:ecommercefrontend/nav/second_top_nav.dart';
import 'package:ecommercefrontend/nav/top_nav.dart';
import 'package:ecommercefrontend/pages/home/category_section/category_section.dart';
import 'package:ecommercefrontend/pages/home/footer_section/footer_section.dart';
import 'package:ecommercefrontend/pages/home/product_section/product_section.dart';
import 'package:ecommercefrontend/pages/home/service_section/service.dart';
import 'package:ecommercefrontend/widgets/about_us_widget.dart';
import 'package:ecommercefrontend/widgets/banner_and_offer.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/common_widgets.dart';
import '../widgets/contact_widget.dart';
import '../widgets/help_widget.dart';
import '../widgets/home_widget.dart';
import '../widgets/login_widget.dart';
import '../widgets/register_widget.dart';

class LargeScreen extends StatefulWidget {
  final String title;
  LargeScreen({required this.title});
  @override
  State<LargeScreen> createState() => _LargeScreenState();
}
// List<String> _page = ['home', 'about', 'help', 'settings'];
class _LargeScreenState extends State<LargeScreen> {
  @override
  Widget build(BuildContext context) {
    print("==========================> Large Screen");
    overallController.currentWidgetWidth.value = MediaQuery.of(context).size.width;
    var homePageContentIndex = !homePageTopNavItemName.contains(widget.title)
        ? homePageTopNavItemName.length-1 : homePageTopNavItemName.indexOf(widget.title);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopNav(),
              const SizedBox(height: 24,),
              const SearchNav(),
              const SizedBox(height: 24,),
              const SecondTopNav(),
              const SizedBox(height: 24,),
              const BannerWithOffer(),
              const SizedBox(height: 24,),
              const ServiceSection(),
              const SizedBox(height: 24,),
              const CategorySection(),
              const SizedBox(height: 24,),
              const ProductSection(sectionTitle: 'FEATURE PRODUCT'),
              const SizedBox(height: 24,),
              const ProductSection(sectionTitle: 'RECENT PRODUCT'),
              const SizedBox(height: 24,),
              FooterSection(height: 500,),
              homePageWidgetList.elementAt(homePageContentIndex),
            ],
          ),
        ),
      ),
    );
  }
}
