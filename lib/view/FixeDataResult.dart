import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qplant/controller/LoggerDef.dart';
import 'package:qplant/model/LocationPlant.dart';
import 'package:qplant/view/Home.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';

class FixeDataResult extends StatefulWidget {
  @override
  _FixeDataResultViewState createState() => _FixeDataResultViewState();
}

// class Animal {
//   //final int id;
//   final String name;
//
//   Animal({
//     //required this.id,
//     required this.name,
//   });
// }

class _FixeDataResultViewState extends State<FixeDataResult> {
  LoggerDef callLog = LoggerDef();

  static List<LocationPlant> _states = [
    LocationPlant(
        state: "AM",
        region: "Norte",
        latitude: -4.999000069645124,
        longitude: -64.58095584285202),
    LocationPlant(
        state: "RR",
        region: "Norte",
        latitude: -4.999000069645124,
        longitude: -64.58095584285202)
  ];

  // static List<Animal> _animals = [
  //   Animal(name: "Lion"),
  //   Animal(name: "Flamingo"),
  //   Animal(name: "Hippo"),
  //   Animal(name: "Horse")
  // ];

  final _items =
      _states.map((e) => MultiSelectItem<LocationPlant>(e, e.state)).toList();

  List? _selectedStates;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://www.agricultura.sp.gov.br/media/13382-red-3929193_1920.jpg",
                          height: 200,
                          width: 200,
                          fit: BoxFit.fill,
                        )
                        //Image.memory()
                        ),
                  ],
                ),
                Flexible(
                    child: Column(
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
                      FontAwesomeIcons.bookOpen,
                      color: Colors.white,
                      size: 70,
                    ),
                  ],
                )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                    child: Column(
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
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1.8),
                          color: Colors.white),
                      title: Text("Estado no Brazil"),
                      buttonText: Text("Estado no Brazil"),
                      searchable: true,
                      buttonIcon: Icon(
                        Icons.search,
                        color: Colors.green,
                      ),
                      listType: MultiSelectListType.CHIP,
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
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            maxLines: 10,
                            cursorColor: Colors.green,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.white,
                              helperStyle:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            keyboardType: TextInputType.multiline,
                            onSaved: (String? v) {
                              //callLog.logger.d("");
                            },
                          ),
                        )
                      ],
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
                          callLog.logger.d("New plant data was save to review");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: new Text("ENVIAR"),
                      ),
                    )
                  ],
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
