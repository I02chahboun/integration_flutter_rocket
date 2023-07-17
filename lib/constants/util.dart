import 'package:flutter/material.dart';

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

