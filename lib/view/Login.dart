import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget{
  //Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{

  bool _validate = false;
  late String _email, _password;
  String _msgError = "";

  //Login Screen
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff075E54)
        ),
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
                      )
                  ),
                ),
                Center(
                  child: Text(
                    "Acessar com:",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
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
                      onTap: (){
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
                      onTap: (){
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
                  ]
                ),
                SizedBox(
                  height: 35,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "OU",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
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
                    child: Column(
                      children: [
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "E-mail",
                            filled: true,
                            fillColor: Colors.white,
                            helperStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String? v){
                            _email = v!;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Senha",
                            filled: true,
                            fillColor: Colors.white,
                            helperStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            ),
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          onSaved: (String? v){
                            _password = v!;
                          },
                        ),
                        SizedBox(
                          height: 50,
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
                                )
                            ),
                            onPressed: () {
                              print("Enviar Login");
                            },
                            child: new Text("CADASTRAR"),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                //Navigator.pushNamed(context, "myRoute");
                                print("Esqueceu a senha?");
                              },
                              child: Text(
                                "Esqueceu a senha?",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                print("Novo aqui? Cadastrar!");
                              },
                              child: Text(
                                "Novo aqui? Cadastrar!",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}