class UserModel {
  late String password, email, name;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    // required this.pic,
  });

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    email = map['email'];
    password = map['password'];
    // pic = map['pic'];
  }

  toJson() {
    return {
      'name': name,
      'email': email,
      'userId': password,
      // 'pic': pic,
    };
  }
}
