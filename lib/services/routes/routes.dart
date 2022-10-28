import 'package:ecommercefrontend/helpers/responsive_widget.dart';
import 'package:ecommercefrontend/pages/auth/authentication.dart';
import 'package:ecommercefrontend/pages/category/specific_category_products_pages.dart';
import 'package:ecommercefrontend/pages/home/home_page.dart';
import 'package:ecommercefrontend/pages/product/product_details_page.dart';
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
const String productDetails = 'productDetails';
const String specificCategoryProducts = 'specificCategoryProducts';
const String auth = 'auth';

GoRouter router = GoRouter(
  initialLocation: '/',

  // redirect: ,
  routes: [
    GoRoute(
      path: '/',
      name: root,
      pageBuilder: (context, state) {
        print('-------------------> initial route');
        return MaterialPage(
          child: ResponsiveWidget(
            key: state.pageKey,
            largeScreen: LargeScreen(
              title: '/',
              child: HomePage(
                title: '/',
              ),
            ),
            mediumScreen: MediumScreen(),
            smallScreen: SmallScreen(),
          ),
        );
      },
      // redirect: (context,state){
      //   return '/';
      // },
      routes: [
        GoRoute(
          path: ':home',
          name: homeContent,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: ResponsiveWidget(
                key: state.pageKey,
                largeScreen: LargeScreen(
                  title: state.params['home'].toString(),
                  child: HomePage(
                    title: state.params['home'].toString(),
                  ),
                ),
                mediumScreen: MediumScreen(),
                smallScreen: SmallScreen(),
              ),
            );
          },
        ),
        GoRoute(
          path: 'auth/:auth',
          name: auth,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: LargeScreen(
                title: '/',
                child: AuthenticationPage(
                  title: state.params['auth'].toString(),
                ),
              ),
            );
          },
        ),
        GoRoute(
          path: 'product/details/:id',
          name: productDetails,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: LargeScreen(
                title: '/',
                child: ProductDetails(),
              ),
            );
          },
        ),
        GoRoute(
          path: 'category/:id/products',
          name: specificCategoryProducts,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const LargeScreen(
                title: '/',
                child: SpecificCategoryProductsPage(),
              ),
            );
          },
        ),
      ],
    ),
  ],
);
