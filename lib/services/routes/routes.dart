import 'package:ecommercefrontend/helpers/responsive_widget.dart';
import 'package:ecommercefrontend/screen/large_screen.dart';
import 'package:ecommercefrontend/screen/medium_screen.dart';
import 'package:ecommercefrontend/screen/small_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String root = '/';
const String home = 'home';
const String contact = 'contact';
const String about = 'about';
const String product = 'product';
const String homeContent = 'homeContent';

GoRouter router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: root,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: ResponsiveWidget(
            key: state.pageKey,
            largeScreen: LargeScreen(
              title: '/',
            ),
            mediumScreen: MediumScreen(),
            smallScreen: SmallScreen(),
          ),
        );
      },
    routes: [
      GoRoute(
        path: ':home',
        name: homeContent,
        pageBuilder: (context,state){
          return NoTransitionPage(
            child: ResponsiveWidget(
            key: state.pageKey,
            largeScreen: LargeScreen(
              title: state.params['home'].toString(),
            ),
            mediumScreen: MediumScreen(),
            smallScreen: SmallScreen(),
          ),
          );
        }
      ),
    ]
  )
]);
