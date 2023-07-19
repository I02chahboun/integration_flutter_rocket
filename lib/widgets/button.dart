import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/constants/util.dart';
import 'package:integration_flutter_rocket/screens/login.dart';
import 'package:integration_flutter_rocket/screens/signup.dart';
import 'package:integration_flutter_rocket/widgets/elevated_button.dart';

class Buttons extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const Buttons({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final bool isSignUp = title == AppTexts.signUp;
    return Column(
      children: [
        ElevatedButtonn(
          title: isSignUp ? AppTexts.titleLogin : AppTexts.titleSignUp,
          onPressed: onPressed,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isSignUp ? AppTexts.heveAccount : AppTexts.alreadyAccount),
            TextButton(
              onPressed: () {
                if (title == AppTexts.signUp) {
                  context.push(SignUp());
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
