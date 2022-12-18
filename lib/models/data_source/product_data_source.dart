import 'dart:math';

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../services/routes/routes.dart';

class ProductDataSource extends DataTableSource{

  final BuildContext context;
  ProductDataSource({required this.context});



  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        // CustomText(text: dataList[index]['id'].toString(),size: 16,color: TEXT_DARK.withOpacity(0.8),),
        CustomText(
          text: '${index+1}',
          size: 16,
          color: TEXT_WHITE.withOpacity(0.8),
        ),
      ),
      DataCell(
        // CustomText(text: dataList[index]['name'].toString(),size: 16,color: TEXT_DARK.withOpacity(0.8),),
        Container(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            maxWidth: 200,
          ),
          child: CustomText(
            text: '${productController.productList[index].name}',
            size: 16,
            color: TEXT_WHITE.withOpacity(0.8),
          ),
        ),
      ),
      DataCell(
        // CustomText(text: dataList[index]['image_url'].toString(),size: 16,color: TEXT_DARK.withOpacity(0.8),),
        loadImage(
            imageUrl: '${productController.productList[index].imageUrl}',
            width: 120,
            height: 80),
      ),
      DataCell(
        // CustomText(text: dataList[index]['quantity'].toString(),size: 16,color: TEXT_DARK.withOpacity(0.8),),
        CustomText(
          text: '${productController.productList[index].quantity}',
          size: 16,
          color: TEXT_WHITE.withOpacity(0.8),
        ),
      ),
      DataCell(
        CustomText(
          text: '${productController.productList[index].regularPrice}',
          size: 16,
          color: TEXT_WHITE,
        ),
      ),DataCell(
        CustomText(
          text: '${productController.productList[index].discountPrice}',
          size: 16,
          color: TEXT_WHITE,
        ),
      ),
      DataCell(
        InkWell(
          onTap: (){
            context.goNamed(adminSpecificProductDetails,
                params: {"id": '${productController.productList[index].id}'});
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
              text: 'Details',
              size: 16,
              color: TEXT_WHITE.withOpacity(0.8),
            ),
          ),
        ),
      ),
      DataCell(
        InkWell(
          onTap: (){
            GoRouter.of(context).goNamed(adminSpecificProductUpdate,
                params: {"id":productController.productList[index].id.toString()});
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
              color: TEXT_WHITE.withOpacity(0.8),
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
  int get rowCount => productController.productList.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
