import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/nav/nav_search.dart';
import 'package:ecommercefrontend/nav/top_nav.dart';
import 'package:ecommercefrontend/nav/user_profile_side_nav.dart';
import 'package:ecommercefrontend/pages/home/footer_section/footer_section.dart';
import 'package:ecommercefrontend/widgets/customer/customer_profile_update_widget.dart';
import 'package:ecommercefrontend/widgets/customer/user_profile_widget.dart';
import 'package:flutter/material.dart';

class CustomerAccountProfilePage extends StatefulWidget {
  const CustomerAccountProfilePage({Key? key}) : super(key: key);

  @override
  State<CustomerAccountProfilePage> createState() => _CustomerAccountProfilePageState();
}

class _CustomerAccountProfilePageState extends State<CustomerAccountProfilePage> {
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
              UserProfileUpdateWidget(totalScreenWidth : (screenSize.width - commonPadding*2))
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
