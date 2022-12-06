import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/category_model.dart';
import 'package:ecommercefrontend/models/product_model.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/product/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../constants/function.dart';

class ProductSection extends StatefulWidget {
  final String sectionTitle;
  List<ProductModel>? products;
  int? index;
  ProductSection({Key? key, required this.sectionTitle,this.products,this.index})
      : super(key: key);
  // static double width = 0;

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {



  static double width = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    width = screenSize.width;
    return Container(
      width: overallController.screenWidth.value,
      padding: EdgeInsets.symmetric(horizontal: commonPadding),
      color: Colors.transparent,
      alignment: Alignment.centerLeft,
      child: Obx((){
        // print('categoryController.categoryListWithProduct.elementAt(widget.index!).products! --------------> '
        //     '${categoryController.categoryListWithProduct.elementAt(widget.index!).products!.length}');
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: '${widget.sectionTitle} -> ${widget.sectionTitle}\t',
                  color: TEXT_DARK,
                  size: 16,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  width: overallController.screenWidth.value * 0.01,
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    // width: overallController.screenWidth.value * 0.65,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 3, color: TEXT_DARK, style: BorderStyle.solid),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Wrap(
              spacing: width * 0.02,
              runSpacing: 40,
              children: categoryController.categoryListWithProduct.elementAt(widget.index!).products!.asMap().entries
                  // .map((product) => ProductCard(product: product,width: (width-width*0.06),))
                  .map((product){

                    return ProductCard(product: product.value, width: width * 0.195);
                    // return Container(
                    //   width:  width * 0.18,
                    //
                    //   padding: const EdgeInsets.all(0),
                    //   margin: const EdgeInsets.all(0),
                    //   color: Colors.red,
                    //   constraints: BoxConstraints(
                    //     minHeight: 450
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Container(
                    //         width: double.infinity,
                    //         height: 320 * 0.6,
                    //         padding: const EdgeInsets.all(8),
                    //         child: loadImage(imageUrl: product.value.imageUrl.toString(), width: (width * 0.18)*0.8, height: 200),
                    //       ),
                    //       Container(
                    //         width: double.infinity,
                    //         // height: 320 * 0.4,
                    //         padding: const EdgeInsets.only(left: 10),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             CustomText(
                    //               text: '${product.value.title}',
                    //               size: 18,
                    //               weight: FontWeight.w500,
                    //               color: TEXT_DARK,
                    //             ),
                    //             const SizedBox(
                    //               height: 8,
                    //             ),
                    //             CustomText(
                    //               text:"\$${product.value.regularPrice}",
                    //               size: 18,
                    //               weight: FontWeight.w500,
                    //               color: TEXT_DARK,
                    //             ),
                    //             const SizedBox(
                    //               height: 8,
                    //             ),
                    //             CustomText(
                    //               text:"\$${product.value.discountPrice}",
                    //               size: 18,
                    //               weight: FontWeight.w500,
                    //               color: TEXT_DARK,
                    //             ),
                    //             RatingBar.builder(
                    //               initialRating: 3.2,
                    //               minRating: 1,
                    //               direction: Axis.horizontal,
                    //               allowHalfRating: true,
                    //               itemCount: 5,
                    //               itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    //               itemSize: 23,
                    //               itemBuilder: (context, _) => const Icon(
                    //                 Icons.star,
                    //                 color: Colors.amber,
                    //               ),
                    //               onRatingUpdate: (rating) {
                    //                 print('-------------------------------> rating $rating');
                    //               },
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // );
              })
                  .toList(),
            ),
          ],
        );
      })
    );
    // return Obx(() {
    //
    //   width = (overallController.screenWidth.value - commonPadding * 2);
    //   return
    // });
  }
}


