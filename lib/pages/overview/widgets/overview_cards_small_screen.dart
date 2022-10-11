

import 'package:ecommercefrontend/pages/overview/widgets/info_card.dart';
import 'package:flutter/material.dart';

class OverviewCardSmallScreen extends StatelessWidget {
  const OverviewCardSmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 400,
      child: Column(
        children: [
          InfoCard(title: "Rides in progress", value: "7", topColor: Colors.orange, isActive: true, onTap: (){}),
          SizedBox(width: screenSize.width / 64,),
          InfoCard(title: "Package delivered", value: "17", topColor: Colors.orange, isActive: true, onTap: (){}),
          SizedBox(width: screenSize.width / 64,),
          InfoCard(title: "Cancelled delivered", value: "17", topColor: Colors.orange, isActive: true, onTap: (){}),
          SizedBox(width: screenSize.width / 64,),
          InfoCard(title: "Schedule delivered", value: "17", topColor: Colors.orange, isActive: true, onTap: (){}),
        ],
      ),
    );
  }
}
