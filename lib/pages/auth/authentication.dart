

import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:ecommercefrontend/nav/second_top_nav.dart';
import 'package:ecommercefrontend/pages/home/footer_section/footer_section.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:ecommercefrontend/widgets/login_widget.dart';
import 'package:ecommercefrontend/widgets/registration_widget.dart';
import 'package:flutter/material.dart';


List<String> _rightItem = ["login", "register"];

List<Widget> _authWidgetList = [
  LoginWidget(),
  RegistrationWidget()
];

class AuthenticationPage extends StatelessWidget {
  final String title;
  int? widgetIndex;
  AuthenticationPage({Key? key, required this.title,this.widgetIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authIndex = _rightItem.indexOf(title);
    // print('Authentication page .....................> > >   $title');
    return Column(
      children: [
        const SecondTopNav(),
        _authWidgetList.elementAt(widgetIndex??(authIndex!=-1?authIndex:0)),
        FooterSection(height: 500,),
      ],
    );
  }
}


