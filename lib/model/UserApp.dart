class UserApp {
  late String idUser;
  late String name;
  late String email;
  late String urlImage;
  late String password;

  UserApp({required this.email});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "name": this.name,
      "email": this.email,
      "image_avatar": this.urlImage
    };
    return map;
  }
}
