import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:qplant/controller/LoggerDef.dart';
import 'package:qplant/view/SetNewPassword.dart';

class PinCodeRecovery extends StatefulWidget {
  //Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<PinCodeRecovery> {
  LoggerDef callLog = LoggerDef();
  //bool _validate = false;
  late String _email;
  //, _password;
  //String _msgError = "";

  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _email = "test@gmail.com";
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
                    "Verifica????o",
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
                        FontAwesomeIcons.smileBeam,
                        color: Colors.white,
                        size: 120,
                      )),
                ),
                Center(
                  child: Text(
                    "Digite o c??digo que lhe enviamos para o e-mail: $_email",
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
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 30),
                            child: PinCodeTextField(
                              appContext: context,
                              autoFocus: true,
                              pastedTextStyle: TextStyle(
                                color: Colors.green.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                              length: 4,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  fieldHeight: 50,
                                  fieldWidth: 70,
                                  activeFillColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  selectedFillColor: Colors.white,
                                  selectedColor: Colors.white,
                                  errorBorderColor: Colors.white,
                                  inactiveColor: Colors.white),
                              cursorColor: Colors.black,
                              animationDuration: Duration(milliseconds: 300),
                              enableActiveFill: true,
                              errorAnimationController: errorController,
                              controller: textEditingController,
                              keyboardType: TextInputType.number,
                              boxShadows: [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ],
                              onCompleted: (v) {
                                callLog.logger.d("Pin code was completed");
                              },
                              onChanged: (value) {
                                setState(() {
                                  currentText = value;
                                });
                              },
                              beforeTextPaste: (text) {
                                callLog.logger
                                    .d("The pin code was paste in the form");
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              },
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        // TODO: Adicionar buttom clear code
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              //width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    onPrimary: Colors.white,
                                    primary: Colors.red,
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                                onPressed: () {
                                  //formKey.currentState!.validate();
                                  if (currentText.length < 4 ||
                                      currentText.isEmpty) {
                                    errorController.add(ErrorAnimationType
                                        .shake); // Triggering error shake animation
                                    setState(() => hasError = true);
                                  } else {
                                    setState(
                                      () {
                                        hasError = false;
                                        if (currentText == "1234") {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SetNewPassword()));
                                        }
                                        //snackBar("OTP Verified!!");
                                      },
                                    );
                                  }
                                  //errorController.close();
                                },
                                child: new Text("VERIFICAR"),
                              ),
                            ),
                            SizedBox(
                              //width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    onPrimary: Colors.white,
                                    primary: Colors.lightGreen,
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                                onPressed: () {
                                  callLog.logger.d(
                                      "The button to clean pin code was pressed");
                                  textEditingController.clear();
                                },
                                child: new Text("LIMPAR"),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "N??o recebeu o c??digo? ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            TextButton(
                                onPressed: () => snackBar("C??digo Reenviado!"),
                                child: Text(
                                  "Reenviar!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ))
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
