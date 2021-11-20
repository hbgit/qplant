import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qplant/model/Plant.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyCatalog extends StatefulWidget {
  @override
  _MyCatalogViewState createState() => _MyCatalogViewState();
}

class _MyCatalogViewState extends State<MyCatalog> {
  List<Plant> _listPlant = [];

  @override
  void initState() {
    _genDemoPlantData();
    super.initState();
  }

  //Demo data
  _genDemoPlantData() {
    List<String> local = ["AM", "PB", "CE"];
    Plant p1 = Plant(
        id: "d011",
        vernacularName: "vernacular_name",
        scientificName: "scientific_name",
        country: "country",
        locality: local,
        flower: true,
        fruit: false);

    _listPlant.add(p1);

    Plant p2 = Plant(
        id: "d012",
        vernacularName: "vernacular_name 2",
        scientificName: "scientific_name 2",
        country: "country",
        locality: local,
        flower: true,
        fruit: false);

    _listPlant.add(p2);
  }

  // Home Screen
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Plant>>(
        //future: _listPlant,
        builder: (context, snapshot) {
      // TODO: adding ConnectionState
      if (_listPlant.isNotEmpty) {
        return ListView.separated(
            itemBuilder: (context, index) {
              Plant tmpP = _listPlant[index];
              return GestureDetector(
                onTap: () {
                  print("Card plant clicked");
                },
                child: Container(
                  padding: EdgeInsets.all(7),
                  height: 181,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    "https://i.pinimg.com/564x/bd/83/5b/bd835b34923609442d47877c84cd4854.jpg",
                                    height: 140,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        tmpP.vernacularName,
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          print("Favoritei");
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.trash,
                                          color: Color(0xffdb4437),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        itemCount: 5,
                                        itemSize: 30,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Color(0xffdb4437),
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      SizedBox(
                                        width: 21,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        tmpP.vernacularName,
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          print("Favoritei");
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.arrowCircleRight,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ))
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
            itemCount: _listPlant.length);
      } else {
        return Container(
          child: Text("Seu Catálago está vazio :("),
        );
      }
    });
  }
}
