import 'package:flutter/material.dart';
import 'package:qplant/controller/RouteGenerator.dart';

class StartApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color(0xff0f9d58), accentColor: Color(0xff0c7e47)),
      onGenerateRoute: (settings) {
        print("SETTINGS: ${settings.name}");
        return RouteGenerator.generatorRoute(settings);
      },
    );
  }
}
