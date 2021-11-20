import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qplant/controller/RouteGenerator.dart';
import 'package:qplant/view/AddNewUser.dart';
import 'package:qplant/view/ForgotPassword.dart';
import 'package:qplant/view/Home.dart';

class Login extends StatefulWidget {
  //Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _key = new GlobalKey();

  bool _validate = false;
  late String _email, _password;
  String _msgError = "";

  String? _validatePassWord(String? value) {
    if (value!.isEmpty) {
      return "Senha vazia.";
    } else if (value == "123") {
      return null;
    }
  }

  String? _validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value!.isEmpty) {
      return "Email vazio.";
    } else if (!regExp.hasMatch(value)) {
      return "E-mail inválido";
    } else {
      return null;
    }
  }

  _showDialog(BuildContext context) {
    AlertDialog showDia = AlertDialog(
      title: Text("Sign In Error"),
      content: Text(_msgError),
      actions: [
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return showDia;
        });
  }

  // _signIn(User user){
  //
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //
  //   auth.signInWithEmailAndPassword(
  //       email: user.email,
  //       password: user.password
  //   ).then((firebaseUser){
  //     Navigator.pushReplacementNamed(context, RouteGenerator.ROUTE_HOME);
  //   }).catchError((onError){
  //     setState(() {
  //       _msgError = "E-mail or Password is not correct, please try again.";
  //       _showDialog(context);
  //     });
  //   });
  //
  // }

  _sendToServer() {
    if (_key.currentState!.validate()) {
      // No any error in validation
      _key.currentState!.save();

      print("Email $_email");
      print("Pass $_password");

      // User user = User();
      // user.email = _email;
      // user.password = _password;

      //_signIn(user);
      Navigator.pushReplacementNamed(context, RouteGenerator.ROUTE_HOME);
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  //Login Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xff075E54)),
        padding: EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 21),
                      child: FaIcon(
                        FontAwesomeIcons.envira,
                        color: Colors.white,
                        size: 90,
                      )),
                ),
                Center(
                  child: Text(
                    "Acessar com:",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Facebook");
                        },
                        child: SizedBox(
                          width: 100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff3b5998),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.facebook,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Twitter");
                        },
                        child: SizedBox(
                          width: 100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff1da1f2),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.twitter,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Google");
                        },
                        child: SizedBox(
                          width: 100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffdb4437),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.google,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 35,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "OU",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Divider(
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          controller:
                              TextEditingController(text: "test@test.com"),
                          autofocus: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "E-mail",
                            filled: true,
                            fillColor: Colors.white,
                            helperStyle:
                                TextStyle(color: Colors.black, fontSize: 20),
                            errorStyle:
                                TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          validator: (value) {
                            return _validateEmail(value);
                          },
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String? v) {
                            _email = v!;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: TextEditingController(text: "1234"),
                          autofocus: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Senha",
                            filled: true,
                            fillColor: Colors.white,
                            helperStyle:
                                TextStyle(color: Colors.black, fontSize: 20),
                            errorStyle:
                                TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          obscureText: true,
                          validator: (value) {
                            return _validatePassWord(value);
                          },
                          keyboardType: TextInputType.text,
                          onSaved: (String? v) {
                            _password = v!;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              primary: Colors.red,
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              print("Enviar Login");
                              _sendToServer();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => Home()));
                            },
                            child: new Text("ACESSAR"),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //Navigator.pushNamed(context, "myRoute");
                                print("Esqueceu a senha?");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPassword()));
                              },
                              child: Text(
                                "Esqueceu a senha?",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("Novo aqui? Cadastrar!");
                                //Navigator.pushNamed(context, "myRoute");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddNewUser()));
                              },
                              child: Text(
                                "Novo aqui? Cadastrar!",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
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
