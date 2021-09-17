import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<Home> {
  //final Auth _auth = Auth();
  int _selectedIndex = 0;
  String _formattedDate =
      DateFormat('EEEE d MMM kk:mm:ss', 'pt_BR').format(DateTime.now());

  _onSelectItem(int index) {
    setState(() => _selectedIndex = index);
    Navigator.of(context).pop();
  }

  _getDrawerItem(int pos) {
    switch (pos) {
      case 0:
        //return Fragment("Tela 1");
        print("Item 0");
        break;
      case 1:
        print("Item 1");
        break;
    }
  }

  // Home Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff075E54),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Menu"),
            Container(
              alignment: Alignment.centerLeft,
              child: FaIcon(
                FontAwesomeIcons.envira,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: FaIcon(
                      FontAwesomeIcons.earlybirds,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Olá: Herbert",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Hoje é $_formattedDate",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 15))
                ],
              ),
              decoration: BoxDecoration(color: Color(0xff0c7e47)),
            ),
            // ListTile(
            //   title: Text("Item 1"),
            //   selected: 0 == _selectedIndex,
            //   onTap: () {
            //     _onSelectItem(0);
            //   },
            // ),
            ListView(
              shrinkWrap: true,
              children: [
                Ink(
                  color: Color(0xff0c7e47),
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.image,
                      color: Colors.white,
                      size: 30,
                    ),
                    title: Text(
                      'With lightGreen background',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15)
                    ),
                    selected: 1 == _selectedIndex,
                    onTap: () {
                      print("Text");
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: _getDrawerItem(_selectedIndex),
    );
  }
}
