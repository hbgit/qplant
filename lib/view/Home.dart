import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:qplant/controller/RouteGenerator.dart';
import 'package:qplant/view/IdentPlant.dart';
import 'package:qplant/view/MyCatalog.dart';

// the seq is equal to the _getDrawerItem function
enum HAM_MENU { home, id_planta, my_catalog, history, about_app, logout }

class Home extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<Home> {
  //final Auth _auth = Auth();
  // Menu var
  int _selectedIndex = HAM_MENU.my_catalog.index;
  int _lastSelectedIndex = 0;
  String _menuPath = "Menu";

  // Header
  String _formattedDate =
      DateFormat('EEEE d MMM kk:mm:ss', 'pt_BR').format(DateTime.now());

  _onSelectItem(int index) {
    if (index == -1) {
      Navigator.of(context).pop();
    } else {
      setState(() => _selectedIndex = index);
      Navigator.of(context).pop();
    }
  }

  _getDrawerItem(int pos) {
    switch (pos) {
      case 0:
        print("Home");
        break;
      case 1:
        print("Identificar Planta");
        return IdentPlant();
      //break;
      case 2:
        print("Meu Catalago");
        return MyCatalog();
      //break;
      case 3:
        print("Histórico");
        break;
      case 4:
        print("Sobre o APP");
        break;
      case 5:
        print("Sair da Conta");
        break;
      default:
        break;
    }
  }

  int _selectOpBtNav(int index) {
    switch (index) {
      case 2:
        return 0;
      case 3:
        return 1;
      case 1:
        return 2;
      default:
        return 0;
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
            Text(_menuPath),
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
                      FontAwesomeIcons.exchangeAlt,
                      color: Colors.white,
                      size: 30,
                    ),
                    title: Text('Voltar',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    //selected: 0 == _selectedIndex,
                    onTap: () {
                      print(HAM_MENU.home);
                      _onSelectItem(-1);
                      // Navigator.of(context).pop();
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => MyCatalog()));
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
                      FontAwesomeIcons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                    title: Text('Identificar Planta',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    //selected: 1 == _selectedIndex,
                    onTap: () {
                      setState(() {
                        _menuPath = "Identificar Planta";
                      });
                      _onSelectItem(HAM_MENU.id_planta.index);
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
                    title: Text('Meu Catálago',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    //selected: 1 == _selectedIndex,
                    onTap: () {
                      setState(() {
                        _menuPath = "Meu Catálago";
                      });
                      _onSelectItem(HAM_MENU.my_catalog.index);
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
                    title: Text('Histórico',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    selected: 2 == _selectedIndex,
                    onTap: () {
                      setState(() {
                        _menuPath = "Histórico";
                      });
                      _onSelectItem(HAM_MENU.history.index);
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
                    title: Text('Sobre o APP',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    selected: 3 == _selectedIndex,
                    onTap: () {
                      setState(() {
                        _menuPath = "Sobre o APP";
                      });
                      _onSelectItem(HAM_MENU.about_app.index);
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
                    title: Text('Sair da Conta',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    selected: 4 == _selectedIndex,
                    onTap: () {
                      setState(() {
                        _menuPath = "Sair da Conta";
                      });
                      _onSelectItem(HAM_MENU.logout.index);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: _getDrawerItem(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectOpBtNav(_selectedIndex),
        onTap: (index) {
          //
          print("BTNav $index");
          setState(() {
            if (index == 0) {
              _selectedIndex = HAM_MENU.my_catalog.index;
              setState(() {
                _menuPath = "Meu Catálago";
              });
            } else if (index == 1) {
              _selectedIndex = HAM_MENU.history.index;
              setState(() {
                _menuPath = "Meu Catálago";
              });
            } else {
              _selectedIndex = HAM_MENU.id_planta.index;
              setState(() {
                _menuPath = "Identificar Planta";
              });
            }
          });
        },
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.image,
              color: Colors.white,
              size: 30,
            ),
            label: "Meu Catálogo",
            backgroundColor: Color(0xff0c7e47),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.history,
              color: Colors.white,
              size: 30,
            ),
            label: "Histórico",
            backgroundColor: Color(0xff20b2aa),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.search,
              color: Colors.white,
              size: 30,
            ),
            label: "Planta?",
            backgroundColor: Color(0xff3cb371),
          ),
        ],
      ),
    );
  }
}
