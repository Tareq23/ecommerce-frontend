import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/nav/nav_search.dart';
import 'package:ecommercefrontend/nav/top_nav.dart';
import 'package:ecommercefrontend/nav/user_profile_side_nav.dart';
import 'package:ecommercefrontend/pages/home/footer_section/footer_section.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/customer/customer_address_widget.dart';
import 'package:ecommercefrontend/widgets/customer/customer_review_widget.dart';
import 'package:flutter/material.dart';

class CustomerAccountReviewPage extends StatefulWidget {
  const CustomerAccountReviewPage({Key? key}) : super(key: key);

  @override
  State<CustomerAccountReviewPage> createState() => _CustomerAccountReviewPageState();
}

class _CustomerAccountReviewPageState extends State<CustomerAccountReviewPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width*0.75;
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const TopNav(),
        const SearchNav(),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: screenSize.width - commonPadding*2,
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountSideNav(totalScreenWidth : (screenSize.width - commonPadding*2),),
              SizedBox(width: ((screenSize.width - commonPadding*2)*0.1),),
              CustomerReviewWidget(totalScreenWidth : (screenSize.width - commonPadding*2),)
            ],
          ),
        ),


        const SizedBox(height: 40,),
        FooterSection(
          height: 500,
        ),
      ],
    );
  }
}
