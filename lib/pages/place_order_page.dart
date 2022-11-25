import 'package:ecommercefrontend/constants/contants.dart';
import 'package:ecommercefrontend/nav/nav_search.dart';
import 'package:ecommercefrontend/nav/top_nav.dart';
import 'package:ecommercefrontend/pages/home/footer_section/footer_section.dart';
import 'package:flutter/material.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({Key? key}) : super(key: key);

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width - commonPadding*2;
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
          width: width,
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _placeOrderCard(context,width*0.65),
              SizedBox(width: width*0.05,),
              _placeOrderCard(context,width*0.3),
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
  Widget _placeOrderCard(BuildContext context,double width){
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Container(
        width: width,
        height: 500,
        padding: EdgeInsets.zero,
        color: Colors.red,
      ),
    );
  }
}
