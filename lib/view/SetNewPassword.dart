import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qplant/view/Login.dart';

class SetNewPassword extends StatefulWidget {
  //Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<SetNewPassword> {
  bool _validate = false;
  late String _email, _password;
  String _msgError = "";

  //Login Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: FaIcon(
                        FontAwesomeIcons.unlockAlt,
                        color: Colors.white,
                        size: 90,
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Nova senha",
                        filled: true,
                        fillColor: Colors.white,
                        helperStyle:
                            TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      onSaved: (String? v) {
                        _password = v!;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Confirme sua senha",
                        filled: true,
                        fillColor: Colors.white,
                        helperStyle:
                            TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      onSaved: (String? v) {
                        _password = v!;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  onPrimary: Colors.white,
                                  primary: Colors.red,
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                              onPressed: () {
                                print("Enviando nova senha");
                              },
                              child: new Text("ENVIAR"),
                            ),
                          ),
                          SizedBox(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  onPrimary: Colors.white,
                                  primary: Colors.lightGreen,
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                              onPressed: () {
                                print("Cancelando nova senha");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: new Text("CANCELAR"),
                            ),
                          ),
                        ]),
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
