import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qplant/view/ClassifyResult.dart';
import 'package:qplant/view/ConfirmImgClassify.dart';

class IdentPlant extends StatefulWidget {
  @override
  _IdentPlantViewState createState() => _IdentPlantViewState();
}

class _IdentPlantViewState extends State<IdentPlant> {
  int _flowScreen = 0;
  int _indexScreenIdPlant = 0;
  List<Widget> _screensIdentPlant = [
    ConfirmImgClassify(),
    ClassifyResult(),
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget _identPlantHome() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.exclamationTriangle,
                color: Colors.white,
                size: 30,
              ),
              Container(
                  width: 300,
                  child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Text(
                          "Para uma melhor identificação, considere estar mais próximo da planta.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ))
            ]),
        Card(
            color: Colors.white,
            child: GestureDetector(
              onTap: () {
                print("Upload");
                //_recoveryImage("galeria");
                //Navigator.of(context).pop();
                //Navigator.push(context, MaterialPageRoute(builder: (context) => UploadImage()));
              },
              child: Padding(
                padding: EdgeInsets.all(11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.fileUpload,
                      color: Color(0xff0c7e47),
                      size: 50,
                    ),
                    Text(
                      "Enviar uma imagem",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff0c7e47),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            )),
        Card(
            color: Colors.white,
            child: GestureDetector(
              onTap: () {
                print("Take photo");
                //_recoveryImage("camera");
              },
              child: Padding(
                padding: EdgeInsets.all(11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.camera,
                      color: Color(0xff0c7e47),
                      size: 50,
                    ),
                    Text(
                      "Tirar uma foto",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff0c7e47),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: _flowScreen == 0
          ? _identPlantHome()
          : _screensIdentPlant[_indexScreenIdPlant],
    );
  }
}