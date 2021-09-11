import 'package:flutter/material.dart';
import 'package:qplant/view/Splash.dart';

class RouteGenerator {
  static const String ROUTE_ROOT = "/";
  static const String ROUTE_HOME = "/home";
  static const String ROUTE_LOGIN = "/login";
  static const String ROUTE_SPLASH = "/splash";

  static Route<dynamic> generatorRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case ROUTE_SPLASH:
        return MaterialPageRoute(builder: (_) => Splash());
      case ROUTE_ROOT:
        return MaterialPageRoute(
            // "_" not allocate memory to var
            builder: (_) => Splash());
      case ROUTE_LOGIN:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Screen not found"),
            ),
            body: Center(
              child: Text("Sorry, I don't found your screen :("),
            ),
          );
        });
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Screen not found"),
            ),
            body: Center(
              child: Text("Sorry, I don't found your screen :("),
            ),
          );
        });
    }
  }
}
