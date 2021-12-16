class UserApp {
  late String idUser;
  late String name;
  late String email;
  late String urlImage;
  late String password;

  UserApp({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {"name": this.name, "email": this.email};
    return map;
  }
}
