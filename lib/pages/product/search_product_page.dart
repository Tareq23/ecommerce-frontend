import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/product_model.dart';
import 'package:ecommercefrontend/nav/nav_search.dart';
import 'package:ecommercefrontend/nav/second_top_nav.dart';
import 'package:ecommercefrontend/nav/top_nav.dart';
import 'package:ecommercefrontend/pages/home/footer_section/footer_section.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/product/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProductPage extends StatefulWidget {
  final String name;
  const SearchProductPage({Key? key, required this.name}) : super(key: key);

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {


  @override
  void didChangeDependencies() async{

    await productController.fetchSearchProductList(widget.name);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    // print('serach product page ---------------:::::::: product name: ${widget.name}');
    return Column(
      children: [
        const TopNav(),
        const SizedBox(height: 24,),
        const SearchNav(),
        const SizedBox(height: 24,),
        const SecondTopNav(),
        const SizedBox(height: 24,),

        Container(
            width: overallController.screenWidth.value,
            padding: EdgeInsets.symmetric(horizontal: commonPadding),
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            child: Obx((){
              if(productController.searchProductList.isEmpty){
                return const Center(child: CustomText(text:'Do not contain any product!'),);
              }
              return Wrap(
                spacing: width * 0.02,
                runSpacing: 40,
                children: [
                  ...productController.searchProductList.asMap().entries.map((e){
                    return ProductCard(product: e.value, width: width * 0.195);
                  }),
                  // ProductCard(product: ProductModel.empty(), width: width * 0.195)
                ],
              );
            })
        ),

        const SizedBox(height: 24,),
        FooterSection(height: 500,),
        // homePageWidgetList.elementAt(homePageContentIndex),
      ],
    );
  }
}
