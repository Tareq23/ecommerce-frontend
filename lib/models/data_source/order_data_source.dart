import 'dart:convert';
import 'dart:math';

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

final List<Map<String, dynamic>> dataList = List.generate(
    500,
    (index) => {
          "id": index + 1, // orderid
          "customerName": "customer name ${index + 1}",
          "orderDate": DateTime.now(),
          "price": Random().nextInt(1000),
          "deliveryStatus": index % 2 == 0
              ? 'complete'
              : index % 3 == 0
                  ? 'rectitude'
                  : index % 5 == 0
                      ? 'continue'
                      : 'cancelled',
          "payment": index % 2 == 0 ? 'completed' : 'pending',
          "details": "details",
        });

class AllOrderDataSource extends DataTableSource {
  final BuildContext context;
  AllOrderDataSource({required this.context});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        CustomText(
          text: '${index + 1}',
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        CustomText(
          // text: dataList[index]['orderDate'].toString(),
          text: orderController.orderList[index].date!,
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        CustomText(
          text: orderController.orderList[index].orderStatus!,
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        CustomText(
          text: orderController.orderList[index].paymentStatus!,
          color: TEXT_WHITE,
        ),
      ),
      DataCell(customActionButton(
          onTap: () {
            GoRouter.of(context).goNamed(adminOrderDetailsPage,
                params: {'id': orderController.orderList[index].id.toString()});
          },
          title: 'Details',
          width: 80)),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => orderController.orderList.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}

class PaymentPendingOrderDataSource extends DataTableSource {
  final BuildContext context;
  PaymentPendingOrderDataSource({required this.context});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        CustomText(
          text: '${index + 1}',
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        CustomText(
          // text: dataList[index]['orderDate'].toString(),
          text: orderController.orderList[index].date!,
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        CustomText(
          text: orderController.orderList[index].orderStatus!,
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        CustomText(
          text: orderController.orderList[index].paymentStatus!,
          color: TEXT_WHITE,
        ),
      ),
      DataCell(customActionButton(
          onTap: () {
            GoRouter.of(context).goNamed(adminOrderDetailsPage,
                params: {'id': orderController.orderList[index].id.toString()});
          },
          title: 'Details',
          width: 80)),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => orderController.orderList.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}

class PaymentCompleteOrderDataSource extends DataTableSource {
  final BuildContext context;
  PaymentCompleteOrderDataSource({required this.context});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        CustomText(
          text: dataList[index]['id'].toString(),
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        CustomText(
          text: dataList[index]['customerName'],
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        CustomText(
          text: dataList[index]['orderDate'].toString(),
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        CustomText(
          text: dataList[index]['price'].toString(),
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        CustomText(
          text: dataList[index]['deliveryStatus'],
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        CustomText(
          text: dataList[index]['payment'],
          color: TEXT_WHITE,
        ),
      ),
      DataCell(customActionButton(
          onTap: () {
            GoRouter.of(context).goNamed(adminOrderDetailsPage,
                params: {'id': dataList[index]['id'].toString()});
          },
          title: 'Details',
          width: 80)),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => dataList.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}

class NewOrderDataSource extends DataTableSource {
  final BuildContext context;
  NewOrderDataSource({required this.context});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        CustomText(
          text: '${index + 1}',
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        CustomText(
          // text: dataList[index]['orderDate'].toString(),
          text: orderController.orderList[index].date!,
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        InkWell(
          onTap: () async {
            await showDialog(
              context: context,
              builder: (context) {
                Size screenSize = MediaQuery.of(context).size;
                return Center(
                  child: Card(
                    elevation: 15,
                    child: Container(
                      width: 300,
                      height: 250,
                      alignment: Alignment.center,
                      child: Obx(
                        () {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue:
                                        overallController.setOrderStatus.value,
                                    onChanged: (value) async {
                                      overallController.setOrderStatus.value =
                                          1;
                                    },
                                  ),
                                  const CustomText(text: 'Pending'),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue:
                                        overallController.setOrderStatus.value,
                                    onChanged: (value) async {
                                      overallController.setOrderStatus.value =
                                          2;
                                    },
                                  ),
                                  const CustomText(text: 'Confirm'),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: 3,
                                    groupValue:
                                        overallController.setOrderStatus.value,
                                    onChanged: (value) async {
                                      overallController.setOrderStatus.value =
                                          3;
                                    },
                                  ),
                                  const CustomText(text: 'Cancel'),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              customActionButton(
                                onTap: () async{
                                  orderController.singleOrder.value = orderController.orderList[index];
                                  switch(overallController.setOrderStatus.value){
                                    case 1:
                                      orderController.singleOrder.value.orderStatus = 'pending';
                                      break;
                                    case 2:
                                      orderController.singleOrder.value.orderStatus = 'confirm';
                                      orderController.singleOrder.value.paymentStatus = 'pending';
                                      break;
                                    case 3:
                                      orderController.singleOrder.value.orderStatus = 'cancel';
                                      break;
                                    default:
                                      Navigator.of(context).pop();
                                      return;
                                  }
                                  await orderController.updateOrderStatusFromAdmin();
                                  Navigator.of(context).pop();
                                },
                                title: 'Ok',
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: CustomText(
            text: orderController.orderList[index].orderStatus!,
            color: TEXT_WHITE,
          ),
        ),
      ),
      DataCell(
        CustomText(
          text: orderController.orderList[index].paymentStatus!,
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        customActionButton(
            onTap: () {
              GoRouter.of(context).goNamed(adminOrderDetailsPage, params: {
                'id': orderController.orderList[index].id.toString()
              });
            },
            title: 'Details',
            width: 80),
      ),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => orderController.orderList.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
