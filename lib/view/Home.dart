import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:qplant/controller/RouteGenerator.dart';
import 'package:qplant/view/MyCatalog.dart';

class Home extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<Home> {
  //final Auth _auth = Auth();
  int _selectedIndex = 0;
  var _mapMenu = {'home':0,'id_planta':1,'meu_catalogo':2,'historico':3,'sobre_app':4,'sair_conta':5};
  String _menuPath = "Menu";
  String _formattedDate =
      DateFormat('EEEE d MMM kk:mm:ss', 'pt_BR').format(DateTime.now());

  _onSelectItem(int index) {
    setState(() => _selectedIndex = index);
    Navigator.of(context).pop();
  }

  _getDrawerItem(int pos) {
    switch (pos) {
      case 1:
        print("Meu Catalago");
        //Navigator.pushNamed(context, RouteGenerator.ROUTE_MY_CATALOG);
        return MyCatalog();
        break;
      case 2:
        print("Histórico");
        break;
      default:
        break;
    }
  }

  _homeScreen(){
    print("TELA");
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            print("Card: Meu Catálago");
            setState(() {
              _menuPath = "Classificador";
              _selectedIndex = 1;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 10.0,
                        color: Colors.greenAccent
                    )
                )
            ),
            padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
            height: 151,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Stack(
                children: [
                  Align(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.camera,
                                    color: Color(0xff075E54),
                                    size: 55,
                                  ),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  Text(
                                      'Identificar Planta',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color(0xff075E54),
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold
                                      )
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.arrowAltCircleRight,
                                    color: Color(0xff075E54),
                                    size: 35,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            print("Card: Meu Catálago");
            setState(() {
              _menuPath = "Meu Catálago";
              _selectedIndex = 1;
            });
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
            height: 151,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Stack(
                children: [
                  Align(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.image,
                                    color: Color(0xff075E54),
                                    size: 55,
                                  ),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  Text(
                                      'Meu Catálago',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color(0xff075E54),
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold
                                      )
                                  ),
                                  SizedBox(
                                    width: 65,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.arrowAltCircleRight,
                                    color: Color(0xff075E54),
                                    size: 35,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            print("Card: Meu Catálago");
            setState(() {
              _menuPath = "Meu Catálago";
              _selectedIndex = 1;
            });
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
            height: 151,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Stack(
                children: [
                  Align(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.history,
                                    color: Color(0xff075E54),
                                    size: 55,
                                  ),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  Text(
                                      'Histórico',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color(0xff075E54),
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold
                                      )
                                  ),
                                  SizedBox(
                                    width: 115,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.arrowAltCircleRight,
                                    color: Color(0xff075E54),
                                    size: 35,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
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
            Text(
                _menuPath
            ),
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
            ListView(
              shrinkWrap: true,
              children: [
                Ink(
                  color: Color(0xff0c7e47),
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.home,
                      color: Colors.white,
                      size: 30,
                    ),
                    title: Text(
                        'Home',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15)
                    ),
                    selected: 0 == _selectedIndex,
                    onTap: () {
                      setState(() {
                        _menuPath = "Menu";
                      });
                      _onSelectItem(0);
                    },
                  ),
                ),
              ],
            ),
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
                      'Meu Catálago',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15)
                    ),
                    selected: 1 == _selectedIndex,
                    onTap: () {
                      setState(() {
                        _menuPath = "Meu Catálago";
                      });
                      _onSelectItem(1);
                    },
                  ),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Ink(
                  color: Color(0xff0c7e47),
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.history,
                      color: Colors.white,
                      size: 30,
                    ),
                    title: Text(
                        'Histórico',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15)
                    ),
                    selected: 2 == _selectedIndex,
                    onTap: () {
                      setState(() {
                        _menuPath = "Histórico";
                      });
                      //print("Text");
                    },
                  ),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Ink(
                  color: Color(0xff0c7e47),
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.infoCircle,
                      color: Colors.white,
                      size: 30,
                    ),
                    title: Text(
                        'Sobre o APP',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15)
                    ),
                    selected: 3 == _selectedIndex,
                    onTap: () {
                      setState(() {
                        _menuPath = "Sobre o APP";
                      });
                    },
                  ),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Ink(
                  color: Color(0xff0c7e47),
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.signOutAlt,
                      color: Colors.white,
                      size: 30,
                    ),
                    title: Text(
                        'Sair da Conta',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15)
                    ),
                    selected: 4 == _selectedIndex,
                    onTap: () {
                      setState(() {
                        _menuPath = "Sair da Conta";
                      });
                      //print("Text");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: _selectedIndex == 0 ? _homeScreen() : _getDrawerItem(_selectedIndex),
    );
  }
}
