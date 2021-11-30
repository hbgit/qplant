import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//import 'package:image_picker_web/image_picker_web.dart';
import 'package:file_picker/file_picker.dart';
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
  //XFile? _image;
  Uint8List? _imageInBytes;
  LoggerDef callLog = LoggerDef();

  //late String _urlRecoveryImage;

  Future<bool?> _recoveryImage() async {
    final ImagePicker _imgPicker = ImagePicker();
    callLog.logger.d("Capture method: " + widget.captureMethod);

    switch (widget.captureMethod) {
      case "camera":
        if (!kIsWeb) {
          // Camera Mobile
          XFile _image =
              (await _imgPicker.pickImage(source: ImageSource.camera))!;
          var bytes = await new File(_image.path).readAsBytes();
          _imageInBytes = bytes;
        }

        return true;
      case "galery":
        if (kIsWeb) {
          callLog.logger.d("Is a web platform");
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowMultiple: false,
            allowedExtensions: ['jpg', 'jpeg', 'png'],
          );

          if (result != null) {
            _imageInBytes = result.files.first.bytes;
            // String fileName = result.files.first.name;
            // Upload file
            //await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes);
          }
        } else {
          XFile _image =
              (await _imgPicker.pickImage(source: ImageSource.gallery))!;
          var bytes = await new File(_image.path).readAsBytes();
          _imageInBytes = bytes;
        }

        return true;
    }
  }

  _getImg2Classify() {
    return Container(
      child: FutureBuilder(
        future: _recoveryImage(),
        builder: (context, snapshot) {
          print(snapshot.hasData);
          if (snapshot.hasData) {
            callLog.logger.d("Path image: ${snapshot.data}");
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
              child: Image.memory(
                _imageInBytes!,
                height: 150,
                scale: 0.5,
              )),
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
                    imageInBytes: _imageInBytes!,
                  ));
  }
}

// _imgCaptured == false
// ?
//     : _confirmImg()
