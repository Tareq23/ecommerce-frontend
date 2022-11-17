import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/nav/nav_search.dart';
import 'package:ecommercefrontend/nav/second_top_nav.dart';
import 'package:ecommercefrontend/nav/top_nav.dart';
import 'package:ecommercefrontend/pages/home/category_section/category_section.dart';
import 'package:ecommercefrontend/pages/home/footer_section/footer_section.dart';
import 'package:ecommercefrontend/pages/home/product_section/product_section.dart';
import 'package:ecommercefrontend/widgets/banner_and_offer.dart';
import 'package:ecommercefrontend/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'service_section/service.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _check=false;


  @override
  void didChangeDependencies() {

    if(!_check){
      // categoryController.fetchAllCategory();
      // overallController.isFetchedCategoryProduct.value = true;
      setState(() {
        _check = true;
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var homePageContentIndex = !homePageTopNavItemName.contains(widget.title)
        ? homePageTopNavItemName.length-1 : homePageTopNavItemName.indexOf(widget.title);
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
        // const CategorySection(),
        // const SizedBox(height: 24,),
        // Container(
        //   padding: const EdgeInsets.all(0),
        //   child: ListView.builder(
        //     itemCount: categoryController.categoryListWithProduct.length,
        //     itemBuilder: (context,index){
        //       return  ProductSection(sectionTitle: 'FEATURE PRODUCT');
        //     },
        //   )
        // ),
        // if(overallController.isFetchedCategoryProduct.value)
        // ...categoryController.categoryListWithProduct.value.map((e){
        //   if(e.productList!.isEmpty) return const SizedBox.shrink();
        //   return ProductSection(sectionTitle: '${e.name}');
        // }),
        const ProductSection(sectionTitle: 'FEATURE PRODUCT'),
        const SizedBox(height: 24,),
        const ProductSection(sectionTitle: 'RECENT PRODUCT'),
        const SizedBox(height: 24,),
        FooterSection(height: 500,),
        // homePageWidgetList.elementAt(homePageContentIndex),
      ],
    );
  }
}
