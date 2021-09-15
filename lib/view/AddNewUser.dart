import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddNewUser extends StatefulWidget{
  //Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<AddNewUser>{

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
                            hintText: "Seu nome completo",
                            filled: true,
                            fillColor: Colors.white,
                            helperStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            ),
                          ),
                          keyboardType: TextInputType.text,
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
                                )
                            ),
                            onPressed: () {
                              print("Enviar cadastro de novo user.");
                            },
                            child: new Text("CADASTRAR"),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                              //push(context,
                              //    MaterialPageRoute(builder: (context) => AddNewUser()));
                            },
                            child: Text(
                              "Já tem uma conta? Clique aqui.",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        )
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