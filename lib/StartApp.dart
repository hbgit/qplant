import 'package:flutter/material.dart';
import 'package:qplant/controller/RouteGenerator.dart';
import 'package:responsive_framework/responsive_framework.dart';

class StartApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          defaultName: MOBILE,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
            ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ]),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color(0xff0f9d58),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Color(0xff0c7e47))),
      onGenerateRoute: (settings) {
        return RouteGenerator.generatorRoute(settings);
      },
    );
  }
}
