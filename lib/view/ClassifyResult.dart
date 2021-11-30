import 'dart:typed_data';

import 'package:flutter/material.dart';

class ClassifyResult extends StatefulWidget {
  final Uint8List imageInBytes;

  ClassifyResult({required this.imageInBytes});

  @override
  _ClassifyResultViewState createState() => _ClassifyResultViewState();
}

class _ClassifyResultViewState extends State<ClassifyResult> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.memory(
                              widget.imageInBytes,
                              height: 200,
                              width: 200,
                            )),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "RESULTADO",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        "100%",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
              Row(),
              Row(),
            ],
          ),
        ));
  }
}
