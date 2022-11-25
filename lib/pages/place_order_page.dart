import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/nav/nav_search.dart';
import 'package:ecommercefrontend/nav/top_nav.dart';
import 'package:ecommercefrontend/pages/home/footer_section/footer_section.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../constants/function.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({Key? key}) : super(key: key);

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

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
              _placeOrderDetailsCard(context,width*0.65),
              SizedBox(width: width*0.05,),
              _placeOrderCard(context,width*0.3),
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



  Widget _placeOrderCard(BuildContext context,double width){
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'Order Summary',size: 16,color: TEXT_DARK.withOpacity(0.8),weight: FontWeight.w600,),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Items Total',size: 16,color: TEXT_DARK.withOpacity(0.8),weight: FontWeight.w500,),
                CustomText(text: '৳ 670',size: 16,color: TEXT_DARK.withOpacity(0.8),weight: FontWeight.w500,),
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Delivery Fee',size: 16,color: TEXT_DARK.withOpacity(0.8),weight: FontWeight.w500,),
                CustomText(text: '৳ 50',size: 16,color: TEXT_DARK.withOpacity(0.8),weight: FontWeight.w500,),
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Total',size: 16,color: TEXT_DARK.withOpacity(0.8),weight: FontWeight.w500,),
                CustomText(text: '৳ 720',size: 16,color: TEXT_DARK.withOpacity(0.8),weight: FontWeight.w500,),
              ],
            ),
            const SizedBox(height: 18,),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){},
                child: Container(
                  width: width * 0.8 - 16,
                  height: 40,
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    color: YELLOW,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const CustomText(text: 'Place Order',size: 16,color: TEXT_WHITE,weight: FontWeight.w600,),
                ),
              ),
            ),
            const SizedBox(height: 18,),
          ],
        ),
      ),
    );
  }



  Widget _placeOrderDetailsCard(BuildContext context,double width){
    return Container(
      width: width,
      height: 500,
      padding: EdgeInsets.zero,
      // color: Colors.red,
      child: Column(
        children: [

         Card(
           margin: EdgeInsets.zero,
           elevation: 0,
           child: Container(
             width: width,
             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 CustomText(text: 'Deliver To : receiver name'),
                 const SizedBox(height: 20,),
                 Row(
                   children: [
                     CustomText(text: 'receiver-number'),
                     const SizedBox(width: 20,),
                     Expanded(
                       child: CustomText(text: 'receiver - address'),
                     )
                   ],
                 ),
                 const SizedBox(height: 20,),
                 InkWell(
                   onTap: (){},
                   child: Container(
                     width: 80,
                     height: 30,
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                       color: YELLOW,
                       borderRadius: BorderRadius.circular(3),
                     ),
                     child: CustomText(text: 'Edit',size: 14,weight: FontWeight.w500,color: TEXT_WHITE,),
                   ),
                 )
               ],
             ),
           ),
         ),

          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                loadImage(imageUrl: '',width: 120,height: 80),
                const SizedBox(width: 20,),
                Expanded(child: CustomText(text: 'product name Bangladesh currency symbol Bangladesh currency symbol',),),
                const SizedBox(width: 40,),
                CustomText(text: 'Qty : 1'),
                const SizedBox(width: 40,),
                CustomText(text: '৳ 670'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                loadImage(imageUrl: '',width: 120,height: 80),
                const SizedBox(width: 20,),
                Expanded(child: CustomText(text: 'product name Bangladesh currency symbol Bangladesh currency symbol',),),
                const SizedBox(width: 40,),
                CustomText(text: 'Qty : 1'),
                const SizedBox(width: 40,),
                CustomText(text: '৳ 670'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
