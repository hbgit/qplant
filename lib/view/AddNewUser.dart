import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:qplant/controller/LoggerDef.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qplant/controller/RouteGenerator.dart';
import 'package:qplant/model/UserApp.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:multiavatar/multiavatar.dart';
import 'package:qplant/model/paint_svg.dart';
import 'package:qplant/model/svg_wrapper.dart';

class AddNewUser extends StatefulWidget {
  //Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<AddNewUser> {
  LoggerDef callLog = LoggerDef();
  bool _statusAction = false;
  //bool _validate = false;
  late String _name, _email, _password;
  //String _msgError = "";
  GlobalKey<FormState> _key = new GlobalKey();

  //Avatar
  String svgCode = multiavatar('X-SLAYER', trBackground: true);
  late DrawableRoot svgRoot;

  String? _validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    RegExp regExp2 = new RegExp(r"([a-zA-Z]+)");
    print(value.length);
    if (value.length == 0) {
      return "Nome é obrigatório.";
    } else if (value.length < 2) {
      return "O nome ter mais 2 letras.";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter a-z ou A-Z.";
    } else if (regExp2.allMatches(value).length <= 1) {
      return "Primeiro e último nome.";
    }
    return null;
  }

  String? _validatePassword(String value) {
    RegExp regExp = new RegExp(r"[0-9]");
    //print(regExp.allMatches(value).length);
    if (value.length < 5) {
      return "O senha deve ter mais de 5 digitos.";
    } else if (regExp.allMatches(value).length < 3) {
      return "A senha deve conter pelo menos 3 números.";
    }
    return null;
  }

  String? _validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email necessário.";
    } else if (!regExp.hasMatch(value)) {
      return "Email inválido :(";
    } else {
      return null;
    }
  }

  _addNewUser(UserApp user) async {
    setState(() {
      _statusAction = true;
    });

    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .createUserWithEmailAndPassword(
            email: user.email, password: user.password)
        .then((firebaseUser) async {
      FirebaseFirestore db = FirebaseFirestore.instance;

      await db.collection("user").doc(firebaseUser.user!.uid).set(user.toMap());

      Navigator.pushNamedAndRemoveUntil(
          context, RouteGenerator.ROUTE_HOME, (_) => false);
    }).catchError((onError) {
      print("ERROR ADD USER" + onError.toString());
    });
  }

  _sendToServer() {
    if (_key.currentState!.validate()) {
      // No any error in validation
      callLog.logger.d("Data new login was validated");
      _key.currentState!.save();
      print("Name $_name");
      print("Email $_email");
      print("Pass $_password");

      UserApp user = UserApp(email: _email);
      user.name = _name;
      user.password = _password;
      user.urlImage = svgCode.toString();
      _addNewUser(user);
    } else {
      // validation error
      setState(() {
        //_validate = true;
        _key.currentState!.deactivate();
      });
    }
  }

  _generateSvg() async {
    return SvgWrapper(svgCode).generateLogo().then((value) {
      setState(() {
        svgRoot = value!;
      });
    });
  }

  Widget _avatarPreview() {
    //_generateSvg();
    return Container(
      height: 180.0,
      width: 180.0,
      child: GestureDetector(
        child: CustomPaint(
          painter: MyPainter(svgRoot, Size(180.0, 180.0)),
        ),
        onTap: () {
          var l = new List.generate(12, (_) => new Random().nextInt(100));
          setState(() {
            svgCode = multiavatar(l.join());
          });
          _generateSvg();
        },
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _generateSvg();
  }

  //Login Screen
  @override
  Widget build(BuildContext context) {
    return _statusAction
        ? Container(
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
          )
        : Scaffold(
            body: Container(
              decoration: BoxDecoration(color: Color(0xff075E54)),
              padding: EdgeInsets.all(15),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 21),
                          child: _avatarPreview(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                          key: _key,
                          child: Column(
                            children: [
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                autofocus: true,
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                  border: InputBorder.none,
                                  hintText: "Seu nome completo",
                                  filled: true,
                                  fillColor: Colors.white,
                                  helperStyle: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  return _validateName(value!);
                                },
                                onSaved: (String? v) {
                                  _name = v!;
                                  callLog.logger
                                      .d("The name used as input: " + _name);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                  border: InputBorder.none,
                                  hintText: "E-mail",
                                  filled: true,
                                  fillColor: Colors.white,
                                  helperStyle: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  return _validateEmail(value!);
                                },
                                onSaved: (String? v) {
                                  _email = v!;
                                  callLog.logger
                                      .d("The email used as input: " + _email);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                  border: InputBorder.none,
                                  hintText: "Senha",
                                  filled: true,
                                  fillColor: Colors.white,
                                  helperStyle: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                obscureText: true,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  return _validatePassword(value!);
                                },
                                onSaved: (String? v) {
                                  _password = v!;
                                  callLog.logger.d(
                                      "The password used as input: " +
                                          _password);
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      onPrimary: Colors.white,
                                      primary: Colors.red,
                                      textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  onPressed: () {
                                    _sendToServer();
                                    callLog.logger
                                        .d("The new user was send to the app");
                                  },
                                  child: new Text("CADASTRAR"),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    //push(context,
                                    //    MaterialPageRoute(builder: (context) => AddNewUser()));
                                  },
                                  child: Text(
                                    "Já tem uma conta? Clique aqui.",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
