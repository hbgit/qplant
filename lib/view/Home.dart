import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<Home> {
  //final Auth _auth = Auth();
  int _selectedIndex = 0;

  _onSelectItem(int index) {
    setState(() => _selectedIndex = index);
    Navigator.of(context).pop();
  }

  // Home Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff075E54),
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Menu"),
              FaIcon(
                FontAwesomeIcons.envira,
                color: Colors.white,
                size: 30,
              )
            ],
          ),
        ),
        drawer: Drawer(
            child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
            DrawerHeader(
              child: Text('Cabeçalho'),
              decoration: BoxDecoration(color: Colors.blueGrey),
            ),
            ListTile(
              title: Text("Item 1"),
              selected: 0 == _selectedIndex,
              onTap: (){
                print("Item 1");
              },
            ),
          ],
        )));
  }
}
