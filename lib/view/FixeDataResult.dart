//import 'dart:async';
//import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qplant/controller/LoggerDef.dart';
//import 'package:qplant/model/LocationPlant.dart';
import 'package:qplant/view/Home.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';

class FixeDataResult extends StatefulWidget {
  @override
  _FixeDataResultViewState createState() => _FixeDataResultViewState();
}

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

class _FixeDataResultViewState extends State<FixeDataResult> {
  LoggerDef callLog = LoggerDef();

  // List<LocationPlant> _states = [
  //   LocationPlant(
  //       state: "AM",
  //       region: "Norte",
  //       latitude: -4.999000069645124,
  //       longitude: -64.58095584285202),
  //   LocationPlant(
  //       state: "RR",
  //       region: "Norte",
  //       latitude: -4.999000069645124,
  //       longitude: -64.58095584285202)
  // ];

  static List<Animal> _animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Horse"),
    Animal(id: 5, name: "Tiger"),
    Animal(id: 6, name: "Penguin"),
    Animal(id: 7, name: "Spider"),
    Animal(id: 8, name: "Snake"),
    Animal(id: 9, name: "Bear"),
    Animal(id: 10, name: "Beaver"),
    Animal(id: 11, name: "Cat"),
    Animal(id: 12, name: "Fish"),
    Animal(id: 13, name: "Rabbit"),
    Animal(id: 14, name: "Mouse"),
    Animal(id: 15, name: "Dog"),
    Animal(id: 16, name: "Zebra"),
    Animal(id: 17, name: "Cow"),
    Animal(id: 18, name: "Frog"),
    Animal(id: 19, name: "Blue Jay"),
    Animal(id: 20, name: "Moose"),
    Animal(id: 21, name: "Gecko"),
    Animal(id: 22, name: "Kangaroo"),
    Animal(id: 23, name: "Shark"),
    Animal(id: 24, name: "Crocodile"),
    Animal(id: 25, name: "Owl"),
    Animal(id: 26, name: "Dragonfly"),
    Animal(id: 27, name: "Dolphin"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();

  List? _selectedStates;

  @override
  Widget build(BuildContext context) {
    //print(_items);
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  "https://www.agricultura.sp.gov.br/media/13382-red-3929193_1920.jpg",
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.fill,
                                )
                                //Image.memory()
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Flexible(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "CORRIGIR DADOS",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FaIcon(
                            FontAwesomeIcons.redoAlt,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                  child: Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Nome da planta:",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          autofocus: true,
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            helperStyle:
                                TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          keyboardType: TextInputType.text,
                          onSaved: (String? v) {
                            //callLog.logger.d("");
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Onde a planta é encontrada:",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        MultiSelectDialogField(
                          onConfirm: (val) {
                            _selectedStates = val;
                          },
                          items: _items,
                          initialValue:
                              _selectedStates, // setting the value of this in initState() to pre-select values.
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Descrição:",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                  child: SizedBox(
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
                        callLog.logger.d("New plant data was save to review");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: new Text("ENVIAR"),
                    ),
                  ),
                ),

                SizedBox(height: 40),
                //################################################################################################
                // MultiSelectDialogField with initial values
                //################################################################################################
              ],
            ),
          )),
    );
  }
}
