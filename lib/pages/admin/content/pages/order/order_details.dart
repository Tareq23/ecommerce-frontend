import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/models/address_model.dart';
import 'package:ecommercefrontend/models/order_model.dart';
import 'package:ecommercefrontend/models/product_model.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {




  @override
  void didChangeDependencies() async{
    if(!overallController.isDidChangeDependencies.value){

      String url = Uri.base.path;
      if(url.length>10){
        int orderId = int.parse(url.split('/').last);
        await orderController.fetchOrderByIdFromAdmin(orderId);
      }

      // orderController.singleOrder.value = OrderModel.withAddress(id: 1,date: '2022/1/1',orderStatus: 'Delivered',productList : [ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name'),
      //   ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name'),
      //   ProductModel.orderedProduct(id: 1,imageUrl: '',quantity: 1, title: 'product title/name')],address: AddressModel(id: 1,receiverName: 'Jon',district: 'Tangail',division: 'Dhaka', subDistrict: 'Tangail Sodor',phoneNumber: '0172*******'));

      overallController.isDidChangeDependencies.value = true;
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          automaticallyImplyLeading: false,
          title: CustomText(text: 'Order Details Page',size: 18,weight: FontWeight.w600,color: TEXT_WHITE,),
          pinned: true,
          expandedHeight: 80,
          centerTitle: false,
          backgroundColor: ADMIN_BG_SEAL_BROWN,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              width: overallController.adminMainContentWidth.value,
              // height: overallController.adminMainContentHeight.value * 0.6,
              padding: const EdgeInsets.only(left: 20,top: 15,bottom: 10,),
              decoration: const BoxDecoration(
                color: TEXT_WHITE
              ),
              child: Obx((){
                if(orderController.singleOrder.value.username!.isEmpty){
                  return const SizedBox.shrink();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    CustomRichText(titleText: 'Ordered By : ', valueText: orderController.singleOrder.value.username!),
                    const SizedBox(height: 10,),
                    CustomRichText(titleText: 'Mobile Number : ', valueText: orderController.singleOrder.value.phoneNumber!),
                    // CustomText(text: 'Order By : ${orderController.singleOrder.value.username!}\nMobile Number : ${orderController.singleOrder.value.phoneNumber}',size: 16,color: TEXT_DARK,weight: FontWeight.w600,),
                    // CustomText(text: 'Order By : ${orderController.singleOrder.value.address?.receiverName}',size: 16,color: TEXT_DARK,weight: FontWeight.w600,),
                    const SizedBox(height: 10,),
                    const CustomText(text: 'Delivered Address',size: 16,color: TEXT_DARK,weight: FontWeight.w600),
                    const SizedBox(height: 10,),
                    CustomRichText(titleText: 'Receiver Name : ', valueText: orderController.singleOrder.value.address!.receiverName!),
                    const SizedBox(height: 10,),
                    CustomRichText(titleText: 'Receiver Mobile Number : ', valueText: orderController.singleOrder.value.address!.phoneNumber!),
                    const SizedBox(height: 10,),

                    RichText(
                      text: TextSpan(
                        text: 'Address Details\n',
                        children: [
                          TextSpan(
                            text: 'Division : ',
                            children: [
                              TextSpan(
                                  text: orderController.singleOrder.value.address?.division!,
                              ),
                            ]
                          ),
                          TextSpan(
                            text: ', District : ',
                            children: [
                              TextSpan(
                                  text: orderController.singleOrder.value.address?.district!,
                              ),
                            ]
                          ),
                          TextSpan(
                            text: ', Sub District : ',
                            children: [
                              TextSpan(
                                  text: orderController.singleOrder.value.address?.subDistrict!,
                              ),
                              TextSpan(
                                text: '    ( ${orderController.singleOrder.value.address?.details!} )',
                              ),
                            ]
                          ),
                        ]
                      ),
                    ),
                  ],
                );
              })
            ),
            const SizedBox(height: 30,),


            SizedBox(
              child: Obx((){
                if(orderController.singleOrder.value.orderDetailsList!.isEmpty){
                  return const SizedBox.shrink();
                }
                return Column(
                  children: [
                    ...orderController.singleOrder.value.orderDetailsList!.asMap().entries.map((e){
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          width: overallController.adminMainContentWidth.value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: '${e.value.product!.title}',
                                size: 16,
                                color: TEXT_DARK.withOpacity(0.8),
                              ),
                              CustomText(
                                text: 'Quantity : ${e.value.productQuantity}',
                                size: 16,
                                color: TEXT_DARK.withOpacity(0.8),
                              ),
                              CustomText(
                                text: 'Price : ${e.value.productPrice}',
                                size: 16,
                                color: TEXT_DARK.withOpacity(0.8),
                              ),
                            ],
                          ),
                        ),
                      );
                    })

                  ],
                );
              }),
            ),

            // Container(
            //   width: overallController.adminMainContentWidth.value,
            //   height: overallController.adminMainContentHeight.value * 0.6,
            //   padding: const EdgeInsets.only(left: 20,top: 15,bottom: 10,),
            //   color: Colors.red,
            // ),
            // Container(
            //   width: overallController.adminMainContentWidth.value,
            //   height: overallController.adminMainContentHeight.value * 0.6,
            //   padding: const EdgeInsets.only(left: 20,top: 15,bottom: 10,),
            //   color: Colors.green,
            // ),
          ]),
        )
      ],
    );
  }
  // Widget _orderCard(BuildContext context, {required OrderModel order, required double width}){
  //   return Container(
  //     padding: EdgeInsets.zero,
  //     margin: const EdgeInsets.only(bottom: 10),
  //     child: Card(
  //       child: Column(
  //         children: [
  //           Container(
  //             width: width,
  //             padding: const EdgeInsets.all(12),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [
  //                     CustomText(
  //                       text: 'Order',
  //                       size: 16,
  //                       color: TEXT_DARK.withOpacity(0.8),
  //                     ),
  //                     InkWell(
  //                       onTap: () {
  //                         // go for manage order
  //                       },
  //                       child: CustomText(
  //                         text: ' #${order.id}',
  //                         size: 16,
  //                         color: TEXT_LINK,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 CustomText(
  //                   text: '${order.date}',
  //                   size: 15,
  //                   color: TEXT_DARK,
  //                 )
  //               ],
  //             ),
  //           ),
  //           const Divider(
  //             height: 0,
  //             thickness: 1.4,
  //             color: BORDER_GREY,
  //           ),
  //           Column(
  //             children: [
  //               ...order.productList!.asMap().entries.map((product){
  //                 return Container(
  //                   margin: const EdgeInsets.only(bottom: 10),
  //                   padding: const EdgeInsets.only(right: 20),
  //                   child: Row(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       loadImage(imageUrl: '${product.value.imageUrl}', width: 200, height: 160),
  //                       const SizedBox(
  //                         width: 12,
  //                       ),
  //                       Expanded(
  //                         child: CustomText(
  //                           text:
  //                           '${product.value.title}',
  //                           size: 16,
  //                           color: TEXT_DARK.withOpacity(0.8),
  //                           weight: FontWeight.w500,
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         width: 12,
  //                       ),
  //                       CustomText(
  //                         text: 'Qty : ${product.value.quantity}',
  //                         size: 16,
  //                         color: TEXT_DARK.withOpacity(0.8),
  //                         weight: FontWeight.w500,
  //                       ),
  //                       const SizedBox(
  //                         width: 20,
  //                       ),
  //                       Container(
  //                         padding:
  //                         const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(12),
  //                           color: BG_BUTTON,
  //                         ),
  //                         child: CustomText(
  //                           text: '${order.orderStatus}',
  //                           size: 16,
  //                           color: TEXT_WHITE.withOpacity(0.8),
  //                           weight: FontWeight.w500,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 );
  //               })
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
