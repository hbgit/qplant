import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget{
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<Splash> {
  //final Auth _auth = Auth();
  String _route = "/";

  Future<bool> _initialCheck() async {
    bool isLogged = true;//await _auth.isLogged();
    return Future.delayed(const Duration(seconds: 5)).then((value) {
      _route = isLogged ? "/home" : "/";
      return true;
    });
  }

  // Splash Screen
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0c7e47),
      child: FutureBuilder(
        future: _initialCheck(),
        builder: (context, snapshot){
          if (snapshot.hasData && snapshot.data == true) {
              print(_route);
              //return _route == "/home" ? HomeScreen() : Login();
              return _route == "/home" ? Center() : Center();
          } else {
           return Center(
             child: Stack(
               children: [
                 Container(
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       scale: 1.5,
                       image: Image.asset("assets/images/logo.png").image,
                       //fit: BoxFit.contain
                     )
                   ),
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