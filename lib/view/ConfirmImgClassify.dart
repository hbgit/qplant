import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ConfirmImgClassify extends StatefulWidget {
  //final String captureMethod;
  //ConfirmImgClassify({required this.captureMethod});

  @override
  _ConfirmImgClassifyViewState createState() => _ConfirmImgClassifyViewState();
}

class _ConfirmImgClassifyViewState extends State<ConfirmImgClassify> {
  late XFile _image;
  late String _urlRecoveryImage;

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
      _image = imageOp;
      print("Path image: ${_image.path}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: kIsWeb
                ? Image.network(
                    _image.path,
                    fit: BoxFit.fitHeight,
                  )
                : Image.file(
                    File(_image.path),
                    fit: BoxFit.fitHeight,
                  ),
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
                    //_flowScreen = 0;
                    //ClassifyResult();
                  });
                },
                child: new Text("CLASSIFICAR"),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
