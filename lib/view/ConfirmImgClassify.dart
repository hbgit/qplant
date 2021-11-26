import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qplant/controller/LoggerDef.dart';
import 'package:qplant/view/ClassifyResult.dart';
import 'package:qplant/view/IdentPlant.dart';

class ConfirmImgClassify extends StatefulWidget {
  final String captureMethod;
  ConfirmImgClassify({required this.captureMethod});

  @override
  _ConfirmImgClassifyViewState createState() => _ConfirmImgClassifyViewState();
}

class _ConfirmImgClassifyViewState extends State<ConfirmImgClassify> {
  bool _backScreen = false;
  bool _classifyPlant = false;
  late XFile _image;
  LoggerDef callLog = LoggerDef();
  //late String _urlRecoveryImage;

  Future<bool?> _recoveryImage() async {
    //late XFile imageOp;
    final ImagePicker _imgPicker = ImagePicker();

    callLog.logger.d("Capture method: " + widget.captureMethod);

    // in case of web adopt https://pub.dev/packages/image_picker_web

    switch (widget.captureMethod) {
      case "camera":
        _image = (await _imgPicker.pickImage(source: ImageSource.camera))!;
        return true;
      case "galery":
        _image = (await _imgPicker.pickImage(source: ImageSource.gallery))!;
        return true;
    }
  }

  _getImg2Classify() {
    return Container(
      child: FutureBuilder(
        future: _recoveryImage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            callLog.logger.d("Path image: ${snapshot.data} :: " + _image.path);

            return _confirmImg();
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
        },
      ),
    );
  }

  _confirmImg() {
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
                    height: 300,
                    scale: 0.5,
                  )
                : Image.file(
                    File(_image.path),
                    height: 300,
                    scale: 0.5,
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
                  callLog.logger.d("Cancel option was clicked");
                  setState(() {
                    _backScreen = true;
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
                  callLog.logger.d("Classify option was adopted");
                  setState(() {
                    _backScreen = true;
                    _classifyPlant = true;
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

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _backScreen == false
            ? _getImg2Classify()
            : _classifyPlant == false
                ? IdentPlant()
                : ClassifyResult(
                    imgInput: _image.path.toString(),
                  ));
  }
}

// _imgCaptured == false
// ?
//     : _confirmImg()
