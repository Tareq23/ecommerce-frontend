import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/models/product_model.dart';
import 'package:ecommercefrontend/nav/nav_search.dart';
import 'package:ecommercefrontend/nav/second_top_nav.dart';
import 'package:ecommercefrontend/pages/home/footer_section/footer_section.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/category_drop_down_widget.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/product/product_card_widget.dart';
import 'package:ecommercefrontend/widgets/search_by_price_range.dart';
import 'package:ecommercefrontend/widgets/specific_categories_products_pages_tops_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpecificCategoryProductsPage extends StatefulWidget {
  const SpecificCategoryProductsPage({Key? key}) : super(key: key);

  @override
  State<SpecificCategoryProductsPage> createState() => _SpecificCategoryProductsPageState();
}

class _SpecificCategoryProductsPageState extends State<SpecificCategoryProductsPage> {

  bool _checkDidChageDependencies = false;


  @override
  void didChangeDependencies() async{
    // if(!overallController.isDidChangeDependencies.value){
    // }

    List<String> url =  Uri.base.path.split("=");

    // print(' ======================>_SpecificCategoryProductsPageState : ${url.length} ${overallController.selectedCategoryId.value}');
    if(url.length>1 && overallController.selectedCategoryId.value == 0){
      await CategoryDropdownWidget.categoryProcess(isRequiredId: true,slug: url[1].toString());
      if(url.length != 2 && mounted){
        GoRouter.of(context).goNamed(root);
      }
    }
    print('======================>overallController.selectedCategoryName.value : ${overallController.selectedCategoryName.value}');
    print('======================>overallController.selectedCategoryId.value : ${overallController.selectedCategoryId.value}');

    if(overallController.selectedCategoryId.value == 0){
      if (!mounted) return;
      GoRouter.of(context).goNamed(root); // not found
    }
    overallController.isDidChangeDependencies.value = true;
    // call category api for  specific category products
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width*0.75;
    return Column(
      children: [
        const SearchNav(),
        const SizedBox(height: 30,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectedCategoriesNav(width: screenSize.width*0.25,),
            SizedBox(
              width: screenSize.width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    width: double.infinity,
                    height: 120,
                    child: Row(
                      children: [
                        // available number of products in specific category
                        Expanded(
                          child: SizedBox(
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: overallController.selectedCategoryName.value,size: 16,color: TEXT_DARK,),
                                const SizedBox(height: 8,),
                                CustomText(text: '741190 items found in ${overallController.selectedCategoryName.value}',size: 16,color: TEXT_DARK.withOpacity(0.7),),
                              ],
                            ),
                          ),
                        ),

                        // search By price range
                        const SearchByPriceRange()
                      ],
                    ),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 40,
                    children: productList
                        .map((product) => ProductCard(product: product,width: screenSize.width * 0.73,),)
                        .toList(),
                  ),
                  const SizedBox(height: 30,),
                ],
              )
            ),
          ],
        ),
        FooterSection(height: 500,),
      ],
    );
  }
}
