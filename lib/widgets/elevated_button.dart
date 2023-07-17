import 'package:flutter/material.dart';

class ElevatedButtonn extends StatelessWidget {
  const ElevatedButtonn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Text('Login'),
      ),
    );
  }
}
