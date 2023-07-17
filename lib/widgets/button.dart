import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/constants/util.dart';
import 'package:integration_flutter_rocket/screens/login.dart';
import 'package:integration_flutter_rocket/screens/signup.dart';
import 'package:integration_flutter_rocket/widgets/elevated_button.dart';

class Buttons extends StatelessWidget {
  final String title;
  const Buttons({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ElevatedButtonn(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title == AppTexts.signUp
                ? AppTexts.heveAccount
                : AppTexts.alreadyAccount),
            TextButton(
              onPressed: () {
                if (title == AppTexts.signUp) {
                  context.push(const SignUp());
                } else {
                  context.push(const LogIn());
                }
              },
              child: Text(title),
            ),
          ],
        )
      ],
    );
  }
}
