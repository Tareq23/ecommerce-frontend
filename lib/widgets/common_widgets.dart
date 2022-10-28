

import 'package:ecommercefrontend/widgets/about_us_widget.dart';
import 'package:ecommercefrontend/widgets/contact_widget.dart';
import 'package:ecommercefrontend/widgets/home_widget.dart';
import 'package:ecommercefrontend/widgets/login_widget.dart';
import 'package:flutter/material.dart';

import 'help_widget.dart';

List<String> homePageTopNavItemName = [
  "about",
  "contact",
  "help",
  "login",
  "/"
];

List<Widget> homePageWidgetList = [
  AboutUsWidget(),
  ContactWidget(),
  HelpWidget(),
  LoginWidget(),
  HomeWidget(),
];