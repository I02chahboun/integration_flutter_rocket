import 'package:flutter_rocket/flutter_rocket.dart';

const String postmodelEmailField = "email";
const String postmodelPasswordField = "password";

class PostModel extends RocketModel<PostModel> {
  String? email;
  String? password;

  PostModel({
    this.email,
    this.password,
  });

  @override
  void fromJson(Map<String, dynamic> json, {bool isSub = false}) {
    email = json[postmodelEmailField];
    password = json[postmodelPasswordField];
    super.fromJson(json, isSub: isSub);
  }

  void updateFields({
    String? emailField,
    String? passwordField,
  }) {
    email = emailField ?? email;
    password = passwordField ?? password;
    rebuildWidget(fromUpdate: true);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data[postmodelEmailField] = email;
    data[postmodelPasswordField] = password;

    return data;
  }
}
