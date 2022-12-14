

import 'package:ecommercefrontend/constants/colors.dart';
import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/constants/function.dart';
import 'package:ecommercefrontend/models/product_model.dart';
import 'package:ecommercefrontend/nav/nav_search.dart';
import 'package:ecommercefrontend/nav/top_nav.dart';
import 'package:ecommercefrontend/nav/user_profile_side_nav.dart';
import 'package:ecommercefrontend/pages/home/footer_section/footer_section.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/customer/user_profile_widget.dart';
import 'package:ecommercefrontend/widgets/search_by_price_range.dart';
import 'package:ecommercefrontend/widgets/specific_categories_products_pages_tops_nav.dart';
import 'package:flutter/material.dart';

class CustomerAccountPage extends StatefulWidget {
  const CustomerAccountPage({Key? key}) : super(key: key);

  @override
  State<CustomerAccountPage> createState() => _CustomerAccountPageState();
}

class _CustomerAccountPageState extends State<CustomerAccountPage> {
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
          color: Colors.grey.withOpacity(0.4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountSideNav(totalScreenWidth : (screenSize.width - commonPadding*2)),
              SizedBox(width: ((screenSize.width - commonPadding*2)*0.1),),
              UserProfileWidget(totalScreenWidth : (screenSize.width - commonPadding*2))
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
