import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';

extension NavigatorContext on BuildContext {
  void push(Widget child) {
    Navigator.push(this, animRoute(child));
  }

  void pop() {
    Navigator.pop(this);
  }

  void pushR(Widget child) {
    Navigator.pushAndRemoveUntil(
        this, animRoute(child), (Route<dynamic> route) => false);
  }
}

Route animRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Validate {
  static String? errorEmail(String? value) {
    final bool isEmail = value!.contains("@");
    if (value.isEmpty || !isEmail) {
      return AppTexts.errorEmail;
    }
    return null;
  }

  static late String? value;
  static String? errorPassword(String? passwordValue) {
    value = passwordValue!;
    if (value!.isEmpty) {
      return AppTexts.errorPassword;
    } else if (passwordValue.length < 8) {
      return AppTexts.characterPassword;
    }
    return null;
  }

  static String? errorConfirmPassword(String? value) {
    if (value!.isEmpty) {
      return AppTexts.errorPassword;
    } else if (Validate.value != value) {
      return AppTexts.errorConfirmPassword;
    }
    return null;
  }
}

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
    ),
  );
}
