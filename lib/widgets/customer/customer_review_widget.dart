import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/services/routes/routes.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class CustomerReviewWidget extends StatefulWidget {
  final double totalScreenWidth;
  const CustomerReviewWidget({Key? key, required this.totalScreenWidth})
      : super(key: key);

  @override
  State<CustomerReviewWidget> createState() => _CustomerReviewWidgetState();
}

class _CustomerReviewWidgetState extends State<CustomerReviewWidget> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: widget.totalScreenWidth * 0.7,
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  height: 150,
                  child: loadImage(imageUrl: '', width: 200, height: 150),
                ),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                          child: CustomText(
                        text:
                            'Delivered product name What I want to achieve is to have a text widget inside a Column of fixed height. When the text is long I want the overflow property which is set to TextOverflow.ellipsis to kick in. The Text widget has its maxLines property set to a high value to allow it to wrap down. But there are other widgets in the column too, both before and after the text widget. The text widget is in an Expanded widget so that it takes up as much room in the column. Full code is pasted below.',
                        size: 16,
                        weight: FontWeight.w500,
                      ),),
                      RatingBar.builder(
                        initialRating: 5,
                        minRating: 2,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                        itemSize: 40,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(
                              '-------------------------------> rating $rating');
                        },
                      ),
                      const SizedBox(height: 30,),
                      CustomText(text: 'Review Details : ',size: 16,color: TEXT_DARK.withOpacity(0.7),weight: FontWeight.w500,),
                      const SizedBox(height: 8,),

                      // Review Text Area
                      SizedBox(
                        width: widget.totalScreenWidth * 0.5,
                        child: TextFormField(
                          minLines: 4,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: outlineInputBorder(),
                            enabledBorder: outlineInputBorder(),
                            focusedBorder: outlineInputBorder(),
                            hintText: 'Please share your feedback about the product:',
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        width: 120,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.2,color: BORDER_GREY)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap:(){},
                              child: const Icon(Icons.camera_alt_outlined,size: 22,),
                            ),
                            const SizedBox(height: 8,),
                            CustomText(text: 'Upload Photo',size: 16,color: TEXT_DARK.withOpacity(0.6),),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
