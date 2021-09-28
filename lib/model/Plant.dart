class Plant {
  late String id;
  late String vernacular_name;
  late String scientific_name;
  late String country;
  late List<String> locality;
  bool flower = false;
  bool fruit = false;

  //Constructor
  Plant(
    {
      required this.id,
      required this.vernacular_name,
      required this.scientific_name,
      required this.country,
      required this.locality,
      required this.flower,
      required this.fruit,
    }
  );
}