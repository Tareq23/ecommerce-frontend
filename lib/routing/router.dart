
import 'package:ecommercefrontend/pages/authentication/authentication.dart';
import 'package:ecommercefrontend/pages/clients/clients.dart';
import 'package:ecommercefrontend/pages/overview/overview.dart';
import 'package:ecommercefrontend/routing/routes.dart';

import 'package:flutter/material.dart';

import '../pages/driver/driver.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name)
  {
    case OverviewPageRoute:
      return _getPageRoute(OverviewPage());
    case DividersPageRoute:
      return _getPageRoute(DriverPage());
    case ClientsPageRoute:
      return _getPageRoute(ClientsPage());
    case AuthenticationPageRoute:
      return _getPageRoute(AuthenticationPage());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child)
{
  return MaterialPageRoute(builder: (context)=> child);
}