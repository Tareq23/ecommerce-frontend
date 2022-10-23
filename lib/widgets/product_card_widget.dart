
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/models/category_model.dart';
import 'package:ecommercefrontend/models/product_model.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/contants.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);
  static double _width = 0;
  final double _cardHeight = 320;
  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        _width = (overallController.screenWidth.value - commonPadding * 2);
        _width = _width - (_width * 0.02) * 3;
        return Container(
          width: _width * 0.25,
          height: _cardHeight,
          padding: const EdgeInsets.all(0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                height: _cardHeight * 0.6,
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  product.imageUrl.toString(),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: double.infinity,
                height: _cardHeight * 0.4,
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: product.title.toString(),
                      size: 18,
                      weight: FontWeight.w500,
                      color: TEXT_DARK,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text:"'\$'${product.price}",
                      size: 18,
                      weight: FontWeight.w500,
                      color: TEXT_DARK,
                    ),
                    RatingBar.builder(
                      initialRating: 3.2,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
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
        );
      },
    );
  }
}