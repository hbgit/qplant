import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qplant/view/PinCodeRecovery.dart';

class ForgotPassword extends StatefulWidget {
  //Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<ForgotPassword> {
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
                        FontAwesomeIcons.envira,
                        color: Colors.white,
                        size: 90,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Esqueceu a sua senha?",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 21),
                      child: FaIcon(
                        FontAwesomeIcons.sadTear,
                        color: Colors.white,
                        size: 120,
                      )),
                ),
                Center(
                  child: Text(
                    "Digite o e-mail associado a sua conta que iremos falar com você.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "E-mail",
                        filled: true,
                        fillColor: Colors.white,
                        helperStyle:
                            TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String? v) {
                        _email = v!;
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
                          print("Recuperar senha.");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PinCodeRecovery()));
                        },
                        child: new Text("ENVIAR"),
                      ),
                    ),
                    SizedBox(
                      height: 50,
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
