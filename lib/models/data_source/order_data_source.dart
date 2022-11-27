import 'dart:math';

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
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
      "payment": index%2==0? 'completed' : 'pending',
      "details": "details",
    });

class CompleteOrderDataSource extends DataTableSource {
  final BuildContext context;
  CompleteOrderDataSource({required this.context});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [

      DataCell(CustomText(text: dataList[index]['id'].toString(),color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['customerName'],color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['orderDate'].toString(),color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['price'].toString(),color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['deliveryStatus'],color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['payment'],color: TEXT_WHITE,),),
      DataCell(customActionButton(onTap: (){
        GoRouter.of(context).goNamed(adminOrderDetailsPage,params: {'id':dataList[index]['id'].toString()});
      }, title: 'Details',width: 80)),

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

class PaymentPendingOrderDataSource extends DataTableSource {
  final BuildContext context;
  PaymentPendingOrderDataSource({required this.context});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [

      DataCell(CustomText(text: dataList[index]['id'].toString(),color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['customerName'],color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['orderDate'].toString(),color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['price'].toString(),color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['deliveryStatus'],color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['payment'],color: TEXT_WHITE,),),
      DataCell(customActionButton(onTap: (){
        GoRouter.of(context).goNamed(adminOrderDetailsPage,params: {'id':dataList[index]['id'].toString()});
      }, title: 'Details',width: 80)),

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
class PaymentCompleteOrderDataSource extends DataTableSource {
  final BuildContext context;
  PaymentCompleteOrderDataSource({required this.context});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [

      DataCell(CustomText(text: dataList[index]['id'].toString(),color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['customerName'],color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['orderDate'].toString(),color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['price'].toString(),color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['deliveryStatus'],color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['payment'],color: TEXT_WHITE,),),
      DataCell(customActionButton(onTap: (){
        GoRouter.of(context).goNamed(adminOrderDetailsPage,params: {'id':dataList[index]['id'].toString()});
      }, title: 'Details',width: 80)),

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

      DataCell(CustomText(text: dataList[index]['id'].toString(),color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['customerName'],color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['orderDate'].toString(),color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['price'].toString(),color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['deliveryStatus'],color: TEXT_WHITE,),),
      DataCell(CustomText(text: dataList[index]['payment'],color: TEXT_WHITE,),),
      DataCell(customActionButton(onTap: (){
        GoRouter.of(context).goNamed(adminOrderDetailsPage,params: {'id':dataList[index]['id'].toString()});
      }, title: 'Details',width: 80)),

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
