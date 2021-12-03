import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qplant/controller/LoggerDef.dart';
import 'package:qplant/model/LocationPlant.dart';
import 'package:qplant/model/Plant.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyCatalog extends StatefulWidget {
  @override
  _MyCatalogViewState createState() => _MyCatalogViewState();
}

class _MyCatalogViewState extends State<MyCatalog> {
  LoggerDef callLog = LoggerDef();
  List<Plant> _listPlant = [];

  @override
  void initState() {
    _genDemoPlantData();
    super.initState();
  }

  //Demo data
  _genDemoPlantData() {
    LocationPlant lp = new LocationPlant();
    lp.state = "RR";
    lp.region = "Norte";
    lp.latitude = 1.6740945622316539;
    lp.longitude = -61.50478414547887;
    Plant p1 = Plant(
        id: "d011",
        vernacularName: "vernacular_name",
        scientificName: "scientific_name",
        country: "country",
        location: lp,
        flower: true,
        fruit: false);

    _listPlant.add(p1);

    LocationPlant lp2 = new LocationPlant();
    lp2.state = "AM";
    lp2.region = "Norte";
    lp2.latitude = -4.999000069645124;
    lp2.longitude = -64.58095584285202;
    Plant p2 = Plant(
        id: "d012",
        vernacularName: "vernacular_name 2",
        scientificName: "scientific_name 2",
        country: "country",
        location: lp2,
        flower: true,
        fruit: false);

    _listPlant.add(p2);

    LocationPlant lp3 = new LocationPlant();
    lp3.state = "AM";
    lp3.region = "Norte";
    lp3.latitude = -4.999000069645124;
    lp3.longitude = -64.58095584285202;
    Plant p3 = Plant(
        id: "d012",
        vernacularName: "vernacular_name 3",
        scientificName: "scientific_name 3",
        country: "country",
        location: lp3,
        flower: true,
        fruit: false);

    _listPlant.add(p3);

    LocationPlant lp4 = new LocationPlant();
    lp4.state = "AM";
    lp4.region = "Norte";
    lp4.latitude = -4.999000069645124;
    lp4.longitude = -64.58095584285202;
    Plant p4 = Plant(
        id: "d012",
        vernacularName: "vernacular_name 4",
        scientificName: "scientific_name 4",
        country: "country",
        location: lp4,
        flower: true,
        fruit: false);

    _listPlant.add(p4);
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
                  callLog.logger.d("The card plant number: " +
                      index.toString() +
                      " was clicked");
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
                                    "https://hmjardins.com.br/tok/wp-content/uploads/2015/06/Goiabeira.jpg",
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
                                          callLog.logger.d(
                                              "The card plant number: " +
                                                  index.toString() +
                                                  " was liked");
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
                                          callLog.logger.d(
                                              "The card plant number: " +
                                                  index.toString() +
                                                  " was rating to: " +
                                                  rating.toString());
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
                                        onTap: () {},
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
