import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qplant/controller/LoggerDef.dart';
import 'package:qplant/view/Login.dart';
import 'package:intl/date_symbol_data_local.dart';

class Splash extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<Splash> {
  //final Auth _auth = Auth();
  LoggerDef callLog = LoggerDef();
  String _route = "/";

  Future<bool> _initialCheck() async {
    // bool isLogged = false; //await _auth.isLogged();
    return Future.delayed(const Duration(seconds: 5)).then((value) {
      //_route = isLogged ? "/home" : "/";
      return true;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('pt_BR', null); //very important
  }

  // Splash Screen
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0c7e47),
      child: FutureBuilder(
        future: _initialCheck(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            //return _route == "/home" ? HomeScreen() : Login();
            return _route == "/home" ? Center() : Login();
          } else {
            callLog.logger.d("Showing splash screen");
            return Center(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      scale: 1.5,
                      image: Image.asset("assets/images/logo.png").image,
                      //fit: BoxFit.contain
                    )),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
