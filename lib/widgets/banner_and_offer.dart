import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/models/fashion.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/special_offer_widget.dart';
import 'package:flutter/material.dart';

class BannerWithOffer extends StatefulWidget {
  const BannerWithOffer({Key? key}) : super(key: key);

  @override
  State<BannerWithOffer> createState() => _BannerWithOfferState();
}

class _BannerWithOfferState extends State<BannerWithOffer> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: 400,
      padding: EdgeInsets.symmetric(horizontal: commonPadding),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: CarouselSlider(
                items: fashionList
                    .map((fashion) => _FashionCarousel(fashion: fashion))
                    .toList(),
                options: CarouselOptions(
                  height: double.infinity,
                  aspectRatio: double.infinity,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  // autoPlayInterval: Duration(seconds: 3),
                  // autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.ease,
                  enlargeCenterPage: true,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                )),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.only(left: 10),
              // color: Colors.teal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SpecialOfferWidget(),
                  SpecialOfferWidget(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FashionCarousel extends StatelessWidget {
  final Fashion fashion;
  const _FashionCarousel({Key? key, required this.fashion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            fashion.imageUrl.toString(),
          ),
          fit: BoxFit.fill,
        ),
        color: TEXT_DARK.withOpacity(0.5),
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: TEXT_DARK.withOpacity(0.55),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      text: fashion.title.toString(),
                      color: ITEM_WHITE,
                      size: 20,
                      weight: FontWeight.w600,
                    )),
                const SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: fashion.sortDesc.toString(),
                  color: ITEM_WHITE,
                  size: 20,
                  weight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    // Show specific category fashion product
                  },
                  child: Container(
                    width: 160,
                    height: 60,
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: TEXT_WHITE, width: 1.2),
                      color: Colors.transparent,
                    ),
                    alignment: Alignment.center,
                    child: const CustomText(
                      text: 'Shop Now',
                      color: TEXT_WHITE,
                      size: 16,
                      weight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
