import 'package:flutter/material.dart';
import 'package:qplant/view/Home.dart';
import 'package:qplant/view/Login.dart';
import 'package:qplant/view/PinCodeRecovery.dart';
import 'package:qplant/view/SetNewPassword.dart';
import 'package:qplant/view/Splash.dart';
import 'package:qplant/view/AddNewUser.dart';
import 'package:qplant/view/ForgotPassword.dart';

class RouteGenerator {
  static const String ROUTE_ROOT = "/";
  static const String ROUTE_HOME = "/home";
  static const String ROUTE_LOGIN = "/login";
  static const String ROUTE_ADD_NEW_USER = "/addnewuser";
  static const String ROUTE_FORGOT_PASSWORD = "/forgotpwd";
  static const String ROUTE_SET_PIN_CODE = "/pincode";
  static const String ROUTE_SET_NEW_PASSWORD = "/setnewpwd";
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
        return MaterialPageRoute(builder: (_) => Login());
      case ROUTE_HOME:
        return MaterialPageRoute(builder: (_) => Home());
      case ROUTE_ADD_NEW_USER:
        return MaterialPageRoute(builder: (_) => AddNewUser());
      case ROUTE_FORGOT_PASSWORD:
        return MaterialPageRoute(builder: (_) => ForgotPassword());
      case ROUTE_SET_PIN_CODE:
        return MaterialPageRoute(builder: (_) => PinCodeRecovery());
      case ROUTE_SET_NEW_PASSWORD:
        return MaterialPageRoute(builder: (_) => SetNewPassword());
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
