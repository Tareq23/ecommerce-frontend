import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProductBuyAndCartButtonWidget extends StatefulWidget {
  const ProductBuyAndCartButtonWidget({Key? key}) : super(key: key);

  @override
  State<ProductBuyAndCartButtonWidget> createState() => _ProductBuyAndCartButtonWidgetState();
}

class _ProductBuyAndCartButtonWidgetState extends State<ProductBuyAndCartButtonWidget> {


  @override
  void didChangeDependencies()async {
    // TODO: implement didChangeDependencies
    // await authenticationController.isLoggedIn();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width - 2 * commonPadding;
    return SizedBox(
      width: (width * 0.5) - 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              if(!authenticationController.isCustomer.value){
                GoRouter.of(context).goNamed(auth,params: {"auth":"login"});
              }
              GoRouter.of(context).goNamed(shippingPlaceOrderPage);
              // print('buy know--------------> ');
            },
            child: Container(
              width: ((width * 0.5) - 20) * 0.4,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: BUTTON_BLUE,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const CustomText(
                text: 'Buy Now',
                size: 18,
                weight: FontWeight.w500,
                color: TEXT_WHITE,
              ),
            ),
          ),
          SizedBox(
            child: Obx((){
              if(overallController.isAddToCartAction.value){
                return CircularProgressIndicator();
              }
              return InkWell(
                onTap: () async{
                  // print('check product cart -----------------> ${authenticationController.isCustomer.value}');
                  if(!authenticationController.isCustomer.value){
                    GoRouter.of(context).goNamed(auth,params: {"auth":"login"});
                  }
                  overallController.isAddToCartAction.value = true;
                  await cartController.addCart(productController.selectedProductForDetails.value);

                  if(mounted){
                    GoRouter.of(context).pushNamed(productDetails,params: {"id":productController.selectedProductForDetails.value.id.toString()});
                  }
                  overallController.isAddToCartAction.value = false;
                },
                child: Container(
                  width: ((width * 0.5) - 20) * 0.4,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: YELLOW,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child:  const CustomText(
                    text: 'Add To Cart',
                    size: 18,
                    weight: FontWeight.w500,
                    color: TEXT_WHITE,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
