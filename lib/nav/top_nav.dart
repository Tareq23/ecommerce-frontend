import 'dart:ui';

import 'package:ecommercefrontend/nav/nav_item.dart';
import 'package:ecommercefrontend/services/api/categorty_api_service.dart';
import 'package:ecommercefrontend/services/jwt/jwt_service.dart';
import 'package:ecommercefrontend/widgets/common_widgets.dart';
import 'package:ecommercefrontend/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/link.dart';

import '../constants/colors.dart';
import '../constants/contants.dart';
import '../constants/controllers.dart';
import '../helpers/responsive_widget.dart';

List<String> _leftItem = ["about", "contact", "help"];
List<String> _rightItem = ["login", "register"];

class TopNav extends StatefulWidget {
  const TopNav({Key? key}) : super(key: key);

  @override
  State<TopNav> createState() => _TopNavState();
}

class _TopNavState extends State<TopNav> {





  @override
  void didChangeDependencies() {

    // print(' top nav ------> overallController.isDidChangeDependencies.value ${overallController.isDidChangeDependencies.value}');
    if(!overallController.isDidChangeDependencies.value){
      print(' top nav ------> overallController.isDidChangeDependencies.value }');
      overallController.isDidChangeDependencies.value = true;
    }

    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 40,
      padding:  EdgeInsets.symmetric(
          horizontal: commonPadding),
      color: BG_GREY,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: overallController.currentWidgetWidth.value * 0.35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _leftItem.map(
                (e) {
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Link(
                      target: LinkTarget.self,
                      uri: Uri.parse('/${e}'),
                      builder: (BuildContext context, Future<void> Function()? followLink) {
                        return NavItem(
                          title: e.toUpperCase(),
                          onTap: () {
                            // print('--------------------$e');
                            if (!itemButtonController.isActive(e)) {
                              itemButtonController.changeActiveItemTo(e);
                              context.go('/${e.toLowerCase()}');
                            }
                          },
                        );
                      },
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          // const CustomText(text: 'Checking Text'),
          Obx((){
            // print('authentication access token :=> ${authenticationController.accessToken.value.length}');
            // print('access token is expired   ${authenticationController.isExpired()}');
            // print('authenticationController.isSuperAdmin.value   ${authenticationController.isSuperAdmin.value}');
            // print('access token is expired   ${authenticationController.isExpired()}');
            if(authenticationController.accessToken.value.length<20){
              return SizedBox(
                width: overallController.currentWidgetWidth.value * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _rightItem
                      .map(
                        (e) => MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Link(
                        target: LinkTarget.self,
                        uri: Uri.parse('/auth/$e'),
                        builder: (BuildContext context, Future<void> Function()? followLink) {
                          return NavItem(
                            title: e.toUpperCase(),
                            onTap: () {
                              // print('--------------------$e');
                                if (!itemButtonController.isActive(e)){
                                itemButtonController.changeActiveItemTo(e);
                                context.go('/auth/$e');
                              }
                            },
                          );
                        },
                      ),
                    ),
                  )
                      .toList(),
                ),
              );
            }
            else{
              print('--------------top nav is admin : ${authenticationController.userLogin.value.isAdmin!}');
              print('--------------top nav is customer : ${authenticationController.userLogin.value.isCustomer!}');
              print('--------------top nav is token length : ${authenticationController.accessToken.value.length}');
              if(authenticationController.userLogin.value.isAdmin!){
                return SizedBox(
                  child: Row(
                    children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Link(
                            uri: Uri.parse('/admin/dashboard'),
                            builder: (BuildContext context, Future<void> Function()? followLink) {
                              return NavItem(
                                title: 'dashboard'.toUpperCase(),
                                onTap: () {
                                  // authenticationController.logout();
                                  // print('logout -------------------------> ${authenticationController.accessToken.value}');
                                  context.go('/admin/dashboard');
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 20,),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Link(
                          uri: Uri.parse('/auth/logout'),
                          builder: (BuildContext context, Future<void> Function()? followLink) {
                            return NavItem(
                              title: 'logout'.toUpperCase(),
                              onTap: () {
                                authenticationController.logout();
                                // print('logout -------------------------> ${authenticationController.accessToken.value}');
                                context.go('/');
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              else if(authenticationController.userLogin.value.isCustomer!){
                return SizedBox(
                  child: Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Link(
                          uri: Uri.parse('/user/1/account'),
                          builder: (BuildContext context, Future<void> Function()? followLink) {
                            return NavItem(
                              title: 'my account'.toUpperCase(),
                              onTap: () {
                                // authenticationController.logout();
                                // print('logout -------------------------> ${authenticationController.accessToken.value}');
                                context.go('/user/1/account');
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 20,),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Link(
                          uri: Uri.parse('/auth/logout'),
                          builder: (BuildContext context, Future<void> Function()? followLink) {
                            return NavItem(
                              title: 'logout'.toUpperCase(),
                              onTap: () {
                                authenticationController.logout();
                                // print('logout -------------------------> ${authenticationController.accessToken.value}');
                                context.go('/');
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              return SizedBox(
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Link(
                    uri: Uri.parse('/auth/logout'),
                    builder: (BuildContext context, Future<void> Function()? followLink) {
                      return NavItem(
                        title: 'logout'.toUpperCase(),
                        onTap: () async {
                          await authenticationController.logout();
                          print('logout -------------------------> ${authenticationController.accessToken.value}');
                          context.go('/');
                        },
                      );
                    },
                  ),
                ),
              );
            }
          },)
        ],
      ),
    );
  }
}


