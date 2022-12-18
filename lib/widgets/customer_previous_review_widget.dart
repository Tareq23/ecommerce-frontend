


import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class CustomerPreviousReviewWidget extends StatefulWidget {
  const CustomerPreviousReviewWidget({Key? key}) : super(key: key);

  @override
  State<CustomerPreviousReviewWidget> createState() => _CustomerPreviousReviewWidgetState();
}

class _CustomerPreviousReviewWidgetState extends State<CustomerPreviousReviewWidget> {


  @override
  void initState() {



    super.initState();
  }

  @override
  void didChangeDependencies()async{
    await reviewController.fetchCustomerReview();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(reviewController.reviewList.isEmpty){
        return const SizedBox.shrink();
        // return Container(height: 20,width: 300,color: Colors.blueAccent,);
      }
      return SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            ...reviewController.reviewList.map((element){
              return Container(
                decoration: const BoxDecoration(
                    border:
                    Border(top: BorderSide(width: 1, color: BORDER_GREY))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                      initialRating: element.rating!,
                      minRating: element.rating!,
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

                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: element.commentText!,
                      size: 14,
                      color: TEXT_DARK.withOpacity(0.8),
                    ),
                    if (element.imageList!.isNotEmpty)
                      Wrap(
                        children: [
                          ...element.imageList!.map(
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
    });
  }
}
