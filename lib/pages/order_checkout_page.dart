import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/nav/nav_search.dart';
import 'package:ecommercefrontend/pages/home/footer_section/footer_section.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/product/select_product_quantity_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../nav/top_nav.dart';

class OrderCheckoutPage extends StatefulWidget {
  const OrderCheckoutPage({Key? key}) : super(key: key);

  @override
  State<OrderCheckoutPage> createState() => _OrderCheckoutPageState();
}

class _OrderCheckoutPageState extends State<OrderCheckoutPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width - commonPadding*2;
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
        Container(
          width: width,
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _placeOrderDetailsCard(context,width*0.65),
              _checkoutOrderDetailsCard(context,width*0.65),
              SizedBox(width: width*0.05,),
              _placeCheckoutOrderCard(context,width*0.3),
            ],
          ),
        ),


        const SizedBox(height: 40,),
        FooterSection(
          height: 500,
        ),
      ],
    );
  }

  Widget _placeCheckoutOrderCard(BuildContext context,double width) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'Order Summary',size: 16,color: TEXT_DARK.withOpacity(0.8),weight: FontWeight.w600,),
            const Divider(thickness: 1.2,),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Total',size: 16,color: TEXT_DARK.withOpacity(0.8),weight: FontWeight.w500,),
                CustomText(text: '৳ 0',size: 16,color: TEXT_DARK.withOpacity(0.8),weight: FontWeight.w500,),
              ],
            ),
            const SizedBox(height: 18,),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){
                  GoRouter.of(context).goNamed(shippingPlaceOrderPage);
                },
                child: Container(
                  width: width * 0.7,
                  height: 40,
                  decoration: BoxDecoration(
                    color: YELLOW,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: CustomText(text: 'Proceed To Checkout',size:16,weight: FontWeight.w500,color: TEXT_WHITE,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _checkoutOrderDetailsCard(BuildContext context,double width){
    return Container(
      width: width,
      padding: EdgeInsets.zero,
      // color: Colors.red,
      child: Column(
        children: [
          Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  loadImage(imageUrl: '',width: 120,height: 80),
                  const SizedBox(width: 8,),
                  Expanded(child: CustomText(text: 'product name Bangladesh currency symbol Bangladesh currency symbol',),),
                  const SizedBox(width: 12,),
                  SelectProductQuantityForBuy(quantityTitle: 'Qty',),
                  const SizedBox(width: 12,),
                  CustomText(text: '৳ 670'),
                  const SizedBox(width: 12,),
                  InkWell(
                    onTap: (){},
                    child: Column(
                      children: [
                        Icon(Icons.delete,size: 22,color: TEXT_DANGER,),
                        const SizedBox(height: 4,),
                        CustomText(text: 'Remove',size: 12,color: TEXT_DARK.withOpacity(0.6),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  loadImage(imageUrl: '',width: 120,height: 80),
                  const SizedBox(width: 8,),
                  Expanded(child: CustomText(text: 'product name Bangladesh currency symbol Bangladesh currency symbol',),),
                  const SizedBox(width: 12,),
                  SelectProductQuantityForBuy(quantityTitle: 'Qty',),
                  const SizedBox(width: 12,),
                  CustomText(text: '৳ 670'),
                  const SizedBox(width: 12,),
                  InkWell(
                    onTap: (){},
                    child: Column(
                      children: [
                        Icon(Icons.delete,size: 22,color: TEXT_DANGER,),
                        const SizedBox(height: 4,),
                        CustomText(text: 'Remove',size: 12,color: TEXT_DARK.withOpacity(0.6),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  loadImage(imageUrl: '',width: 120,height: 80),
                  const SizedBox(width: 8,),
                  Expanded(child: CustomText(text: 'product name Bangladesh currency symbol Bangladesh currency symbol',),),
                  const SizedBox(width: 12,),
                  SelectProductQuantityForBuy(quantityTitle: 'Qty',),
                  const SizedBox(width: 12,),
                  CustomText(text: '৳ 670'),
                  const SizedBox(width: 12,),
                  InkWell(
                    onTap: (){},
                    child: Column(
                      children: [
                        Icon(Icons.delete,size: 22,color: TEXT_DANGER,),
                        const SizedBox(height: 4,),
                        CustomText(text: 'Remove',size: 12,color: TEXT_DARK.withOpacity(0.6),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
