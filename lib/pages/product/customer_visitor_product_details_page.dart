import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/models/product_model.dart';
import 'package:ecommercefrontend/nav/nav_search.dart';
import 'package:ecommercefrontend/nav/top_nav.dart';
import 'package:ecommercefrontend/pages/home/footer_section/footer_section.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/product/product_buy_and_add_to_cart.dart';
import 'package:ecommercefrontend/widgets/product/product_description.dart';
import 'package:ecommercefrontend/widgets/product/product_review_portion.dart';
import 'package:ecommercefrontend/widgets/search_by_price_range.dart';
import 'package:ecommercefrontend/widgets/product/select_product_quantity_widget.dart';
import 'package:ecommercefrontend/widgets/specific_categories_products_pages_tops_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerOrVisitorProductDetailsPage extends StatefulWidget {
  const CustomerOrVisitorProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<CustomerOrVisitorProductDetailsPage> createState() =>
      _CustomerOrVisitorProductDetailsPageState();
}

class _CustomerOrVisitorProductDetailsPageState
    extends State<CustomerOrVisitorProductDetailsPage> {


  @override
  void didChangeDependencies() async {
    String url = Uri.base.path;
    print('------------------> product url path $url');
    if(url.length>10){
      int productId = int.parse(url.split('/').last);
      await productController.fetchProductByIdForVisitorOrCustomer(productId);
    }

    await authenticationController.isLoggedIn();

    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width - 2 * commonPadding;
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const TopNav(),
        const SearchNav(),
        const SizedBox(
          height: 30,
        ),

        // product image, quantity, buy, add to cart button
        Obx((){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: commonPadding),
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  width: width * 0.5,
                  height: 320,
                  padding: const EdgeInsets.all(10),
                  // color: Colors.red,
                  child: loadImage(imageUrl: '${productController.selectedProductForDetails.value.imageUrl}',width: width * 0.5,height: 300),
                ),
                Container(
                  width: width * 0.5,
                  // color: Colors.greenAccent,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // PRODUCT NAME OR TITLE
                      CustomText(
                        text: '${productController.selectedProductForDetails.value.title}',
                        size: 16,
                        weight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // PRICE
                      CustomText(
                        text: 'Regular Price : ট ${productController.selectedProductForDetails.value.regularPrice}',
                        size: 16,
                        weight: FontWeight.w500,
                        color: TEXT_RED,
                        decoration: productController.selectedProductForDetails.value.discountPrice == 0 ? TextDecoration.none : TextDecoration.lineThrough,
                      ),
                      // discount price
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: 'Discount Price : ট ${productController.selectedProductForDetails.value.discountPrice}',
                        size: 16,
                        weight: FontWeight.w500,
                        color: TEXT_RED,
                        decoration: productController.selectedProductForDetails.value.discountPrice == 0 ? TextDecoration.lineThrough : TextDecoration.none,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // PRODUCT QUANTITY
                      const SelectProductQuantityForBuy(),
                      const SizedBox(
                        height: 130,
                      ),
                      // product buy and add to button cart
                      ProductBuyAndCartButtonWidget(),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
        const SizedBox(height: 40,),

        // product details portion
        ProductDescriptionWidget(),

        const SizedBox(height: 40,),
        // product review portion
        ProductReviewWidget(),


        const SizedBox(height: 40,),
        FooterSection(
          height: 500,
        ),
      ],
    );
  }
}
