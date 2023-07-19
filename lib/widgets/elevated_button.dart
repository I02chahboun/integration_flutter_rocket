import 'package:flutter/material.dart';

class ElevatedButtonn extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const ElevatedButtonn(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(title),
      ),
    );
  }
}
