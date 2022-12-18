import 'dart:html';

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/controller/order_controller.dart';
import 'package:ecommercefrontend/nav/nav_search.dart';
import 'package:ecommercefrontend/nav/top_nav.dart';
import 'package:ecommercefrontend/pages/home/footer_section/footer_section.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_html/html.dart' as html;

import '../constants/function.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({Key? key}) : super(key: key);

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (!overallController.isDidChangeDependencies.value) {

        overallController.isDidChangeDependencies.value = true;
      }
    });

    if (kIsWeb) {
      if (!overallController.isDidChangeDependencies.value) {
        overallController.fetchUserInfo();
        overallController.isDidChangeDependencies.value = true;
      }
    } else {
      // WidgetsBinding.instance!.addObserver(this);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    await overallController.fetchUserInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width - commonPadding * 2;
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
        Obx(() {
          if (overallController.customerInfo.value.id == null) {
            return CircularProgressIndicator();
          } else {
            return Container(
              width: width,
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _placeOrderDetailsCard(context, width * 0.65),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  _placeOrderCard(context, width * 0.3),
                ],
              ),
            );
          }
        }),
        const SizedBox(
          height: 40,
        ),
        FooterSection(
          height: 500,
        ),
      ],
    );
  }

  Widget _placeOrderCard(BuildContext context, double width) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Order Summary',
              size: 16,
              color: TEXT_DARK.withOpacity(0.8),
              weight: FontWeight.w600,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Items Total',
                  size: 16,
                  color: TEXT_DARK.withOpacity(0.8),
                  weight: FontWeight.w500,
                ),
                CustomText(
                  text: '৳ ${overallController.totalProductPrice.value}',
                  size: 16,
                  color: TEXT_DARK.withOpacity(0.8),
                  weight: FontWeight.w500,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Delivery Fee',
                  size: 16,
                  color: TEXT_DARK.withOpacity(0.8),
                  weight: FontWeight.w500,
                ),
                CustomText(
                  text: '৳ 50',
                  size: 16,
                  color: TEXT_DARK.withOpacity(0.8),
                  weight: FontWeight.w500,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Total',
                  size: 16,
                  color: TEXT_DARK.withOpacity(0.8),
                  weight: FontWeight.w500,
                ),
                CustomText(
                  text: '৳ ${overallController.totalOrderPrice.value}',
                  size: 16,
                  color: TEXT_DARK.withOpacity(0.8),
                  weight: FontWeight.w500,
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Align(
              alignment: Alignment.center,
              child: overallController.isOrderAction.value ? const CircularProgressIndicator() :  InkWell(
                onTap: () async {
                  if(overallController.customerInfo.value.cartList!.isNotEmpty){
                    overallController.isOrderAction.value = true;
                    await orderController.addOrder();
                    overallController.isOrderAction.value=false;
                  }
                },
                child: Container(
                  width: width * 0.8 - 16,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: YELLOW,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const CustomText(
                    text: 'Place Order',
                    size: 16,
                    color: TEXT_WHITE,
                    weight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget _placeOrderDetailsCard(BuildContext context, double width) {
    return Container(
      width: width,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text:
                          'Deliver To : ${overallController.customerDefaultAddress.value.receiverName}'),
                  // CustomText(text: 'Deliver To : ${overallController.customerInfo.value.name}'),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomText(
                          text:
                              'মোবাইল নাম্বার: ${overallController.customerDefaultAddress.value.phoneNumber}'),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: CustomText(
                            text:
                                '${overallController.customerDefaultAddress.value.address}'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      // show pop up modal for select default address or add new address
                      await _setDefaultAddress(context);
                    },
                    child: Container(
                      width: 80,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: YELLOW,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: CustomText(
                        text: 'Edit',
                        size: 14,
                        weight: FontWeight.w500,
                        color: TEXT_WHITE,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ...overallController.customerInfo.value.cartList!
              .asMap()
              .entries
              .map((e) {
            // print(e.value.product!.imageUrl!);
            return Container(
              margin: EdgeInsets.only(bottom: 20, top: e.key == 0 ? 20 : 0),
              width: double.infinity,
              color: Colors.red,
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  loadImage(imageUrl: e.value.product!.imageUrl!.toString(), width: 120, height: 80),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomText(
                      text: e.value.product!.title!,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () async {
                      await cartController.deleteCart(e.value);
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  CustomText(text: 'Qty : ${e.value.productQuantity}'),
                  const SizedBox(
                    width: 40,
                  ),
                  CustomText(text: '৳ ${e.value.productPrice}'),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Future<void> _setDefaultAddress(BuildContext context) async {
    int? _value = 0;
    await showDialog(
      context: context,
      builder: (context) {
        Size screenSize = MediaQuery.of(context).size;
        return Center(
          child: Card(
            elevation: 15,
            child: Container(
              width: screenSize.width * 0.5,
              height: screenSize.height * 0.8,
              // padding: const EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: BORDER_GREY, width: 1.3)),
                    ),
                    child: CustomText(
                      text: 'Set Receiver Address',
                      size: 16,
                      color: TEXT_DARK.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: (screenSize.height * 0.8) * 0.85,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ...overallController.customerInfo.value.addressList!
                              .asMap()
                              .entries
                              .map((e) {
                            if (e.value.isDefault!) {
                              overallController.setDefaultAddressId.value =
                                  e.value.id!;
                            }
                            return Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  Obx(() {
                                    return Radio(
                                      value: e.value.id,
                                      groupValue: overallController
                                          .setDefaultAddressId.value,
                                      onChanged: (value) async{
                                        overallController.setDefaultAddressId
                                            .value = e.value.id!;
                                        // print('default address changes ${overallController.setDefaultAddressId
                                        //     .value}');
                                       await locationController.updateDefaultAddress(overallController.setDefaultAddressId
                                            .value);
                                       if(mounted){
                                         Navigator.of(context).pop();
                                       }
                                      },
                                    );
                                  }),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  CustomText(text: e.value.address!),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
