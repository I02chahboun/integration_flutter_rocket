import 'package:flutter_rocket/flutter_rocket.dart';

const String postNameField = "name";
const String postEmailField = "email";
const String postPasswordField = "password";

class Post extends RocketModel<Post> {
  String? name;
  String? email;
  int? password;

  Post({
    this.name,
    this.email,
    this.password,
  });

  @override
  void fromJson(Map<String, dynamic> json, {bool isSub = false}) {
    name = json[postNameField];
    email = json[postEmailField];
    password = json[postPasswordField];
    super.fromJson(json, isSub: isSub);
  }

  void updateFields({
    String? nameField,
    String? emailField,
    int? passwordField,
  }) {
    name = nameField ?? name;
    email = emailField ?? email;
    password = passwordField ?? password;
    rebuildWidget(fromUpdate: true);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data[postNameField] = name;
    data[postEmailField] = email;
    data[postPasswordField] = password;

    return data;
  }
}
