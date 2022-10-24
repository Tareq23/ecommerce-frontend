import 'package:ecommercefrontend/nav/nav_search.dart';
import 'package:ecommercefrontend/nav/second_top_nav.dart';
import 'package:ecommercefrontend/nav/top_nav.dart';
import 'package:ecommercefrontend/pages/home/category_section/category_section.dart';
import 'package:ecommercefrontend/pages/home/footer_section/footer_section.dart';
import 'package:ecommercefrontend/pages/home/product_section/product_section.dart';
import 'package:ecommercefrontend/widgets/banner_and_offer.dart';
import 'package:ecommercefrontend/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

import 'service_section/service.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homePageContentIndex = !homePageTopNavItemName.contains(title)
        ? homePageTopNavItemName.length-1 : homePageTopNavItemName.indexOf(title);
    return Column(
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
    );
  }
}
