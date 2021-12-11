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
  List<Plant> _listFoundPlantResult = [];

  @override
  void initState() {
    _genDemoPlantData();
    _listFoundPlantResult = _listPlant;
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

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Plant> _listPlantResult = [];
    if (enteredKeyword.isEmpty) {
      _listPlantResult = _listPlant;
    } else {
      _listPlantResult = _listPlant
          .where((element) => element.vernacularName
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      //_foundUsers = results;
      _listFoundPlantResult = _listPlantResult;
    });
  }

  // Home Screen
  @override
  Widget build(BuildContext context) {
    //print(_listPlant);
    return Padding(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.text,
            cursorColor: Colors.green,
            decoration: const InputDecoration(
              labelText: 'Search',
              labelStyle: TextStyle(color: Colors.black),
              border: InputBorder.none,
              filled: true,
              suffixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              fillColor: Colors.white,
              helperStyle: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onChanged: (value) => _runFilter(value),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: _listPlant.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: _listFoundPlantResult.length,
                    itemBuilder: (context, index) => Card(
                      key: ValueKey(index),
                      color: Colors.white,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    "https://hmjardins.com.br/tok/wp-content/uploads/2015/06/Goiabeira.jpg",
                                    height: 140,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _listFoundPlantResult[index].vernacularName,
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                                Text(
                                  _listFoundPlantResult[index].scientificName,
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemSize: 30,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Color(0xffdb4437),
                                  ),
                                  onRatingUpdate: (rating) {
                                    callLog.logger.d("The card plant number: " +
                                        index.toString() +
                                        " was rating to: " +
                                        rating.toString());
                                  },
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: FaIcon(
                                    FontAwesomeIcons.trash,
                                    color: Color(0xffdb4437),
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Text("Seu Catálago está vazio :("),
          ),
        ],
      ),
    );
  }
}
