import 'package:ecommercefrontend/helpers/responsive_widget.dart';
import 'package:ecommercefrontend/pages/admin/admin_home_dashboard.dart';
import 'package:ecommercefrontend/pages/admin/content/category_content.dart';
import 'package:ecommercefrontend/pages/admin/content/product_content.dart';
import 'package:ecommercefrontend/pages/auth/authentication.dart';
import 'package:ecommercefrontend/pages/category/specific_category_products_pages.dart';
import 'package:ecommercefrontend/pages/home/home_page.dart';
import 'package:ecommercefrontend/pages/not_found.dart';
import 'package:ecommercefrontend/pages/product/customer_visitor_product_details_page.dart';
import 'package:ecommercefrontend/pages/product/product_details_page.dart';
import 'package:ecommercefrontend/screen/admin_large_screen.dart';
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
const String notFound = 'notFound';

const String adminRoot = 'adminRoot';
const String adminFirstItem = 'adminFirstItem';
const String adminProductSecondItem = 'adminProductSecondItem';
const String adminCategorySecondItem = 'adminCategorySecondItem';
const String specificCategoryUpdate = 'specificCategoryUpdateById';
const String adminProductContentPage = 'adminProductContentPage';
const String adminSpecificProductUpdate = 'adminSpecificProductUpdate';
const String adminSpecificProductDetails = 'adminSpecificProductDetails';
const String adminAddNewProduct = 'adminAddNewProduct';
const String adminSpecificCategoryAdd = 'adminSpecificCategoryAdd';
const String adminCategoryViewAll = 'adminCategoryViewAll';

GoRouter router = GoRouter(
  initialLocation: '/',

  // redirect: ,
  routes: [
    GoRoute(
      path: '/',
      name: root,
      pageBuilder: (context, state) {
        // print('------------------->current route : /');
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

        // productDetails
        GoRoute(
          path: 'product/details/:id',
          name: productDetails,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: LargeScreen(
                title: '/',
                child: CustomerOrVisitorProductDetailsPage(),
              ),
            );
          },
        ),

        //specificCategoryProducts
        GoRoute(
          path: 'category/name=:name',
          name: specificCategoryProducts,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: LargeScreen(
                title: '/',
                child: SpecificCategoryProductsPage(),
              ),
            );
          },
        ),

        // Admin route url
        GoRoute(
            path: 'admin/dashboard',
            name: adminRoot,
            pageBuilder: (context, state) {
              return MaterialPage(
                child: ResponsiveWidget(
                  key: state.pageKey,
                  largeScreen: AdminLargeScreen(
                    child: AdminHome(title: 'overview',),
                  ),
                  mediumScreen: MediumScreen(),
                  smallScreen: SmallScreen(),
                ),
              );
            },
            routes: [
              // GoRoute(
              //   path: ':first',
              //   name: adminFirstItem,
              //   pageBuilder: (context, state) {
              //     return NoTransitionPage(
              //       key: state.pageKey,
              //       child: ResponsiveWidget(
              //         key: state.pageKey,
              //         largeScreen: AdminLargeScreen(
              //           child: AdminHome(title: state.params['first'].toString(),),
              //         ),
              //         mediumScreen: MediumScreen(),
              //         smallScreen: SmallScreen(),
              //       ),
              //     );
              //   },
              //   routes: [
              //     GoRoute(
              //       path: 'product/:second',
              //       name: adminProductSecondItem,
              //       pageBuilder: (context, state){
              //         return NoTransitionPage(
              //           key: state.pageKey,
              //           child: ResponsiveWidget(
              //             key: state.pageKey,
              //             largeScreen: AdminLargeScreen(
              //               child: AdminHome(title: state.params['second'].toString(),),
              //             ),
              //             mediumScreen: MediumScreen(),
              //             smallScreen: SmallScreen(),
              //           ),
              //         );
              //       },
              //     ),
              //
              //   ]
              // ),
              GoRoute(
                  path: 'category',
                  name: adminCategoryViewAll,
                  pageBuilder: (context, state){
                    return NoTransitionPage(
                      key: state.pageKey,
                      child: ResponsiveWidget(
                        key: state.pageKey,
                        largeScreen: AdminLargeScreen(
                          child: AdminCategoryContentPage(title: "view",),
                        ),
                        mediumScreen: MediumScreen(),
                        smallScreen: SmallScreen(),
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'add',
                      name: adminSpecificCategoryAdd,
                      pageBuilder: (context, state){
                        return NoTransitionPage(
                          key: state.pageKey,
                          child: ResponsiveWidget(
                            key: state.pageKey,
                            largeScreen: AdminLargeScreen(
                              child: AdminCategoryContentPage(title: "add",),
                            ),
                            mediumScreen: MediumScreen(),
                            smallScreen: SmallScreen(),
                          ),
                        );
                      },
                    ),
                    GoRoute(
                      path: 'update/:id',
                      name: specificCategoryUpdate,
                      pageBuilder: (context, state){
                        return NoTransitionPage(
                          key: state.pageKey,
                          child: ResponsiveWidget(
                            key: state.pageKey,
                            largeScreen: AdminLargeScreen(
                              child: AdminCategoryContentPage(title: "update",),
                            ),
                            mediumScreen: MediumScreen(),
                            smallScreen: SmallScreen(),
                          ),
                        );
                      },
                    ),
                  ]
              ),
              GoRoute(
                  path: 'product',
                  name: adminProductContentPage,
                  pageBuilder: (context, state){
                    return NoTransitionPage(
                      key: state.pageKey,
                      child: ResponsiveWidget(
                        key: state.pageKey,
                        largeScreen: AdminLargeScreen(
                          child: AdminProductContentPage(title: 'view',),
                        ),
                        mediumScreen: MediumScreen(),
                        smallScreen: SmallScreen(),
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'update/:id',
                      name: adminSpecificProductUpdate,
                      pageBuilder: (context, state){
                        return NoTransitionPage(
                          key: state.pageKey,
                          child: ResponsiveWidget(
                            key: state.pageKey,
                            largeScreen: AdminLargeScreen(
                              child: AdminProductContentPage(title: 'update',),
                            ),
                            mediumScreen: MediumScreen(),
                            smallScreen: SmallScreen(),
                          ),
                        );
                      },
                    ),
                    GoRoute(
                      path: 'details/:id',
                      name: adminSpecificProductDetails,
                      pageBuilder: (context, state){
                        return NoTransitionPage(
                          key: state.pageKey,
                          child: ResponsiveWidget(
                            key: state.pageKey,
                            largeScreen: AdminLargeScreen(
                              child: AdminProductContentPage(title: 'details',),
                            ),
                            mediumScreen: MediumScreen(),
                            smallScreen: SmallScreen(),
                          ),
                        );
                      },
                    ),
                    GoRoute(
                      path: 'add',
                      name: adminAddNewProduct,
                      pageBuilder: (context, state){
                        return NoTransitionPage(
                          key: state.pageKey,
                          child: ResponsiveWidget(
                            key: state.pageKey,
                            largeScreen: AdminLargeScreen(
                              child: AdminProductContentPage(title: 'add',),
                            ),
                            mediumScreen: MediumScreen(),
                            smallScreen: SmallScreen(),
                          ),
                        );
                      },
                    ),
                  ]
              ),
            ]
        )
      ],
    ),
  ],
);
