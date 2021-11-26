import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ClassifyResult extends StatefulWidget {
  final String imgInput;
  ClassifyResult({required this.imgInput});

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
                          child: kIsWeb
                              ? Image.network(
                                  widget.imgInput,
                                  height: 200,
                                  width: 200,
                                )
                              : Image.file(
                                  File(widget.imgInput),
                                  height: 140,
                                  width: 140,
                                ),
                        ),
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
