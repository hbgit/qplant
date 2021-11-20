class Plant {
  late String id;
  late String vernacularName;
  late String scientificName;
  late String country;
  late List<String> locality;
  bool flower = false;
  bool fruit = false;

  //Constructor
  Plant({
    required this.id,
    required this.vernacularName,
    required this.scientificName,
    required this.country,
    required this.locality,
    required this.flower,
    required this.fruit,
  });
}
