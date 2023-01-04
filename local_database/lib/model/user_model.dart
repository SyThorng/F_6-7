import 'package:local_database/connection/user_data.dart';
import 'package:local_database/constant/database_field.dart';

class User {
  int? uid;
  String? name;
  int? age;
  String? image;

  User({this.uid, this.age, this.name, this.image});

  Map<String, dynamic> toJson() {
    return {fuId!: uid, fuName!: name, fuAge!: age, fuImage!: image};
  }

  User.FromJson(Map<String, dynamic> res) {
    uid = res[fuId];
    name = res[fuName];
    age = res[fuAge];
    image = res[fuImage];
  }

  // User.FromJson(Map<String, dynamic> res)
  // :uid=res[fuId]
  // ,name=res[fuName]
  // ,age=res[fuAge]

}
