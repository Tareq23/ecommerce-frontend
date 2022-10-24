import 'package:ecommercefrontend/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/colors.dart';
import '../widgets/custom_text.dart';

class SearchNav extends StatefulWidget {
  const SearchNav({Key? key}) : super(key: key);

  @override
  State<SearchNav> createState() => _SearchNavState();
}

class _SearchNavState extends State<SearchNav> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      padding:  EdgeInsets.symmetric(horizontal: commonPadding),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          // Logo Button
          SizedBox(
            width: screenSize.width * 0.14,
            child: InkWell(
              onTap: () {
                context.go('/');
              },
              child: _logo(context),
            ),
          ),


          // search by product name
          SizedBox(
              width: screenSize.width * 0.35,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: _searchBorder(context),
                        border: _searchBorder(context),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.all(0),
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.8,color: TEXT_DARK.withOpacity(0.7),),
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8),),
                        color: ITEM_WHITE,
                      ),
                      child: const Icon(
                        Icons.search,
                        color: YELLOW,
                        size: 24,
                      ),
                    ),
                  )
                ],
              )),
          
          SizedBox(
            width: screenSize.width * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(text: 'Customer Service',color: TEXT_DARK.withOpacity(0.8),size: 18,weight: FontWeight.w500,),
                const CustomText(text: '+8801*********',color: TEXT_DARK,size: 18,weight: FontWeight.w400,),
              ],
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder _searchBorder(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        borderSide: BorderSide(
          width: 0.8,
          color: TEXT_DARK.withOpacity(0.7),
        ));
  }

  Widget _logo(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      // margin: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffc0bebe).withOpacity(0.8),
              Color(0xff725c5c).withOpacity(0.8),
              Color(0xff9b9260).withOpacity(0.8),
              Color(0xff587e2b).withOpacity(0.8),
              Color(0xff228f73).withOpacity(0.8),
              Color(0xff162644).withOpacity(0.8),
              Color(0xff620429).withOpacity(0.8),
            ]),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BORDER_RED, width: 1.2),
      ),
      child: const CustomText(
        text: 'LOGO',
        color: Color(0xfff5f5f5),
        size: 24,
        weight: FontWeight.w600,
      ),
    );
  }
}
