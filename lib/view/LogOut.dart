import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class LogOut extends StatefulWidget {
  @override
  _LogOutViewState createState() => _LogOutViewState();
}

class _LogOutViewState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/unsplash_bye.jpg",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 20,
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
                  )),
              onPressed: () {
                //callLog.logger.d("Log out was adopted");
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.WARNING,
                    headerAnimationLoop: false,
                    animType: AnimType.TOPSLIDE,
                    showCloseIcon: true,
                    closeIcon: Icon(Icons.close_fullscreen_outlined),
                    title: 'Saindo',
                    desc: 'Esperamos ver você em breve :)',
                    btnCancelOnPress: () {},
                    onDissmissCallback: (type) {
                      debugPrint('Dialog Dissmiss from callback $type');
                    },
                    btnOkOnPress: () {
                      debugPrint('Saindo');
                    })
                  ..show();
              },
              child: new Text("SAIR"),
            ),
          )
        ],
      ),
    );
  }
}
