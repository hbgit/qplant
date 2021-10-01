import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class IdentPlant extends StatefulWidget {
  @override
  _IdentPlantViewState createState() => _IdentPlantViewState();
}

class _IdentPlantViewState extends State<IdentPlant> {
  late XFile _image;
  late String _urlRecoveryImage;

  int _flowScreen = 0;

  @override
  void initState() {
    super.initState();
  }

  Future _recoveryImage(String fromImage) async {
    late XFile imageOp;
    final ImagePicker _imgPicker = ImagePicker();

    switch (fromImage) {
      case "camera":
        imageOp = (await _imgPicker.pickImage(source: ImageSource.camera))!;
        break;
      case "galeria":
        print(">> Galeria");
        imageOp = (await _imgPicker.pickImage(source: ImageSource.gallery))!;
        break;
    }


    print(imageOp.path);
    setState(() {
      _flowScreen = 1;
      _image = imageOp;
      print("Path image: ${_image.path}");
    });
  }

  Widget _identPlantHome(){
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
                      )
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  )
              )
            ]
        ),
        Card(
            color: Colors.white,
            child: GestureDetector(
              onTap: (){
                print("Upload");
                _recoveryImage("galeria");
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
                      color:Color(0xff0c7e47),
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
            )
        ),
        Card(
            color: Colors.white,
            child: GestureDetector(
              onTap: (){
                print("Take photo");
                _recoveryImage("camera");
              },
              child: Padding(
                padding: EdgeInsets.all(11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.camera,
                      color:Color(0xff0c7e47),
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
            )
        )
      ],
    );
  }

  Widget _confirmeImage(){
    return Container(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: kIsWeb ?
              Image.network(_image.path,
                fit: BoxFit.fitHeight,
              ) :
              Image.file(File(_image.path),
                fit: BoxFit.fitHeight,),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.red,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    print("CANCELAR");
                    setState(() {
                      _flowScreen = 0;
                    });
                  },
                  child: new Text("CANCELAR"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black,
                    primary: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    print("CLASSIFICAR");
                    setState(() {
                      _flowScreen = 0;
                    });
                  },
                  child: new Text("CLASSIFICAR"),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: _flowScreen == 0 ? _identPlantHome() : _confirmeImage(),
    );
  }
}