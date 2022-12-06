
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/models/category_model.dart';
import 'package:ecommercefrontend/models/product_model.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/contants.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final double width;
  const ProductCard({Key? key, required this.product, required this.width}) : super(key: key);
  // static double _width = 0;
  final double _cardHeight = 320;
  @override
  Widget build(BuildContext context) {
    // print('-----------------------> product card  section : ${product.title}');
    product.title= '${product.title} ${product.title} ${product.title} ${product.title}';
    var titleLength = product.title!.length;
    var text = product.title!;
    // print('-----------------------> product card  section title length : ${text.length}');

    if(titleLength>50){
      text = product.title!.substring(0,50);
      text = '${product.title} ....';
    }
    // print('-----------------------> product card  section title length : ${text.length}');
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Link(
        target: LinkTarget.self,
        uri: Uri.parse('/product/details/${product.id}'),
        builder: (context,followLink){
          // print('------------------------<>------------------->${Uri.base}');
          return InkWell(
            onTap: followLink,
            child: Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              child: Container(
                width:  width,
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(0),
                color: BG_WHITE,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(0),
                      child: loadImage(imageUrl: product.imageUrl.toString(), width: width, height: 300),
                    ),
                    Container(
                      width: double.infinity,
                      // height: 320 * 0.4,
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          CustomText(
                            text: titleLength>50 ? '${product.title!.substring(0,50)}....' : product.title!,
                            size: 18,
                            weight: FontWeight.w500,
                            color: TEXT_DARK,
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          CustomText(
                            text:"\$${product.regularPrice}",
                            size: 18,
                            weight: FontWeight.w500,
                            color: TEXT_DARK,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomText(
                            text:"\$${product.discountPrice}",
                            size: 18,
                            weight: FontWeight.w500,
                            color: TEXT_DARK,
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          RatingBar.builder(
                            initialRating: 3.2,
                            minRating: 3.2,
                            maxRating: 3.2,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            glow: false,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                            itemSize: 23,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print('-------------------------------> rating $rating');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}