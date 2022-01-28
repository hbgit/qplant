import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:qplant/controller/services/UserDB.dart';
import 'package:qplant/model/UserApp.dart';
import 'package:qplant/view/AboutApp.dart';
import 'package:qplant/view/History.dart';
import 'package:qplant/view/IdentPlant.dart';
import 'package:qplant/view/LogOut.dart';
import 'package:qplant/view/MyCatalog.dart';
import 'package:qplant/controller/LoggerDef.dart';

// the seq is equal to the _getDrawerItem function
enum HAM_MENU { home, id_planta, my_catalog, history, about_app, logout }
final FirebaseAuth auth = FirebaseAuth.instance;

class Home extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<Home> {
  LoggerDef callLog = LoggerDef();
  UserDB ud = UserDB();
  User userLog = auth.currentUser!;
  //final Auth _auth = Auth();
  // Menu var
  int _selectedIndex = HAM_MENU.my_catalog.index;
  //int _lastSelectedIndex = 0;
  String _menuPath = "Menu";
  UserApp userApp = UserApp(email: "email@qplant.com");
  Map<String, dynamic> _dataUserDB = {};

  // Header
  String _formattedDate =
      DateFormat('EEEE d MMM kk:mm:ss', 'pt_BR').format(DateTime.now());

  //String? _getUserName = FirebaseAuth.instance.currentUser!.displayName;
  Future<Map<String, dynamic>> recoveryDataUser() async {
    User userLog = auth.currentUser!;
    UserDB ud = UserDB();
    //Map<String, dynamic> dataDbUser = await ud.recoveryUserDocument(userLog.uid);
    return await ud.recoveryUserDocument(userLog.uid) as Map<String, dynamic>;
  }

  @override
  void initState() {
    super.initState();
    //recoveryDataUser();
  }

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
        callLog.logger.d("Draw home screen");
        break;
      case 1:
        callLog.logger.d("Draw identify plant screen");
        return IdentPlant();
      //break;
      case 2:
        callLog.logger.d("Draw my plants catalog screen");
        return MyCatalog();
      //break;
      case 3:
        callLog.logger.d("Draw history screen");
        return History();
      case 4:
        callLog.logger.d("Draw about app screen");
        return AboutApp();
      case 5:
        callLog.logger.d("Draw logout screen");
        return LogOut();
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

  _setUserName() {
    userApp.email = _dataUserDB['email'];
    userApp.name = _dataUserDB['name'];
    userApp.urlImage = _dataUserDB['image_avatar'];
  }

  Widget _userAvatar() {
    return Container(
      height: 80.0,
      width: 80.0,
      child: GestureDetector(
        child: SvgPicture.string(userApp.urlImage),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.white,
          width: 5,
        ),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _mainScreen() {
    _setUserName();

    return Scaffold(
      backgroundColor: Color(0xff075E54),
      appBar: AppBar(
        backgroundColor: Color(0xff075E54),
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
        backgroundColor: Color(0xff0c7e47),
        child: ListView(
          //padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: _userAvatar(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Olá: " + userApp.name,
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
            SizedBox(
              height: 10,
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Ink(
                  color: Color(0xff0c7e47),
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.backspace,
                      color: Colors.white,
                      size: 30,
                    ),
                    title: Text('Voltar',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    //selected: 0 == _selectedIndex,
                    onTap: () {
                      _onSelectItem(-1);
                      // Navigator.of(context).pop();
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => MyCatalog()));
                    },
                  ),
                ),
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
            SizedBox(
              height: 70,
            ),
            Center(
              child: FaIcon(
                FontAwesomeIcons.earlybirds,
                color: Colors.white,
                size: 50,
              ),
            ),
            Text('QPlant',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15)),
          ],
        ),
      ),
      body: _getDrawerItem(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectOpBtNav(_selectedIndex),
        onTap: (index) {
          setState(() {
            if (index == 0) {
              _selectedIndex = HAM_MENU.my_catalog.index;
              setState(() {
                _menuPath = "Meu Catálago";
              });
            } else if (index == 1) {
              _selectedIndex = HAM_MENU.history.index;
              setState(() {
                _menuPath = "Meu Histórico";
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

  // Home Screen
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ud.recoveryUserDocument(userLog.uid),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          //Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
          //print(snapshot.data['email']);
          //print(querySnapshot.data());
          // userApp.email = snapshot.data['email'];
          // userApp.urlImage = snapshot.data['image_avatar'];
          // userApp.name = snapshot.data['name'];
          _dataUserDB['email'] = snapshot.data['email'];
          _dataUserDB['image_avatar'] = snapshot.data['image_avatar'];
          _dataUserDB['name'] = snapshot.data['name'];
          return _mainScreen();
        }

        return Container(
          color: Color(0xff0c7e47),
          child: SpinKitFadingCube(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.white : Colors.green,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
