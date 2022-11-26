import 'dart:math';

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BrandDataSource extends DataTableSource{

  final BuildContext context;
  BrandDataSource({required this.context});

  // final List<Map<String, dynamic>> dataList = List.generate(
  //     500,
  //         (index) => {
  //       "id": index + 1,
  //       "name": "product name ${index + 1}",
  //       "imageUrl": 'https://image_url',
  //       "price": Random().nextInt(1000),
  //       "quantity": Random().nextInt(100),
  //       "details": "details",
  //       "edit": "edit",
  //       "delete": "delete",
  //     });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        CustomText(
          text: '${categoryController.categoryListAdmin[index].id}',
          size: 16,
          color: TEXT_WHITE.withOpacity(0.8),
        ),
      ),
      DataCell(
        CustomText(
          text: '${categoryController.categoryListAdmin[index].name}',
          size: 16,
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        // CustomText(text: dataList[index]['image_url'].toString(),size: 16,color: TEXT_DARK.withOpacity(0.8),),
        loadImage(
            imageUrl: 'd',
            width: 200,
            height: 120),
      ),


      DataCell(
        InkWell(
          onTap: (){
            // context.goNamed(adminSpecificProductDetails,
            //     params: {"id": 'j'});
          },
          child: Container(
            width: 80,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: TEXT_DANGER,
              borderRadius: BorderRadius.circular(4),
            ),
            child: CustomText(
              text: 'Products',
              size: 16,
              color: TEXT_DARK.withOpacity(0.8),
            ),
          ),
        ),
      ),
      DataCell(
        InkWell(
          onTap: (){
            // GoRouter.of(context).goNamed(adminSpecificProductUpdate,
            //     params: {"id":productController.productList[index].id.toString()});
            // GoRouter.of(context)
          },
          child: Container(
            width: 80,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: TEXT_DANGER,
              borderRadius: BorderRadius.circular(4),
            ),
            child: CustomText(
              text: 'Edit',
              size: 16,
              color: TEXT_DARK.withOpacity(0.8),
            ),
          ),
        ),
      ),
      DataCell(
        InkWell(
          onTap: (){
            // GoRouter.of(context).goNamed(adminSpecificProductUpdate,
            //     params: {"id":productController.productList[index].id.toString()});
            // GoRouter.of(context)
          },
          child: Container(
            width: 80,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: TEXT_DANGER,
              borderRadius: BorderRadius.circular(4),
            ),
            child: CustomText(
              text: 'Delete',
              size: 16,
              color: TEXT_DARK.withOpacity(0.8),
            ),
          ),
        ),
      ),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => categoryController.categoryListAdmin.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}