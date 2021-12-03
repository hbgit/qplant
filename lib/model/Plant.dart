import 'package:qplant/model/LocationPlant.dart';

class Plant {
  late String id;
  late String vernacularName;
  late String scientificName;
  late String country;
  LocationPlant location;
  bool flower = false;
  bool fruit = false;

  //Constructor
  Plant({
    required this.id,
    required this.vernacularName,
    required this.scientificName,
    required this.country,
    required this.location,
    required this.flower,
    required this.fruit,
  });
}
