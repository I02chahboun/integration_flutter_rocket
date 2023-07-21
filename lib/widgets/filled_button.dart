import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';

class FilledButtonn extends StatelessWidget {
  const FilledButtonn({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Text(AppTexts.addBasket),
        ));
  }
}
