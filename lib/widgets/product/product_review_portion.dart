import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/models/review_model.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductReviewWidget extends StatelessWidget {
  const ProductReviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width - 2 * commonPadding;
    return Container(
      padding: const EdgeInsets.all(0),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(text: 'Product Reviews',size: 16,weight: FontWeight.w500,color: TEXT_DARK.withOpacity(0.9),),
          ...reviewList.map((review) {
            return Container(
              width: width,
              padding: const EdgeInsets.all(0),
              decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(width: 1, color: BORDER_GREY))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RatingBar.builder(
                    initialRating: review.rating!,
                    minRating: review.rating!,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
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
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: review.customerName!,
                    size: 14,
                    color: TEXT_DARK.withOpacity(0.7),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: review.commentText!,
                    size: 14,
                    color: TEXT_DARK.withOpacity(0.8),
                  ),
                  if (review.imageList!.isNotEmpty)
                    Wrap(
                      children: [
                        ...review.imageList!.map(
                          (e) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10,top: 10,bottom: 5),
                              child: loadImage(
                                  imageUrl: e, width: 80, height: 120),
                            );
                          },
                        )
                      ],
                    )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
