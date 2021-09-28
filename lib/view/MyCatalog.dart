import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:qplant/model/Plant.dart';

class MyCatalog extends StatefulWidget {
  @override
  _MyCatalogViewState createState() => _MyCatalogViewState();
}

class _MyCatalogViewState extends State<MyCatalog> {

  List<Plant> _listPlant = [];

  @override
  void initState(){
    super.initState();
  }

  //Demo data
  _genDemoPlantData(){

    List<String> local = ["AM", "PB", "CE"];
    Plant p1 = Plant(
        id: "d011",
        vernacular_name: "vernacular_name",
        scientific_name: "scientific_name",
        country: "country",
        locality: local,
        flower: true,
        fruit: false
    );

    _listPlant.add(p1);

    Plant p2 = Plant(
        id: "d012",
        vernacular_name: "vernacular_name 2",
        scientific_name: "scientific_name 2",
        country: "country",
        locality: local,
        flower: true,
        fruit: false
    );

    _listPlant.add(p2);

  }

  // Home Screen
  @override
  Widget build(BuildContext context) {
    _genDemoPlantData();
    return FutureBuilder<List<Plant>>(
        //future: _listPlant,
        builder: (context, snapshot){
          // TODO: adding ConnectionState
          if(_listPlant.isNotEmpty){
            return ListView.separated(
                itemBuilder: (context, index){
                  Plant tmp_p = _listPlant[index];
                  return GestureDetector(
                    onTap: () => setState((){
                      print("Plant");
                    }),
                    child: Container(
                      padding: EdgeInsets.all(7),
                      height: 181,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        "https://i.pinimg.com/564x/bd/83/5b/bd835b34923609442d47877c84cd4854.jpg",
                                        height: 111,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        //crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            tmp_p.vernacular_name,
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 21
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              print("Favoritei");
                                            },
                                            child: FaIcon(
                                              FontAwesomeIcons.trash,
                                              color: Colors.grey,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("02 de Jan"),
                                          FaIcon(
                                            FontAwesomeIcons.arrowAltCircleRight,
                                            color: Colors.grey,
                                            size: 20,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 2,
                  color: Colors.grey,
                ),
                itemCount: _listPlant.length
            );
          }else{
            return Container(
              child: Text("Seu Catálago está vazio :("),
            );
          }
        }
    );
  }
}
