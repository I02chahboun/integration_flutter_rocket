import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/widgets/elevated_button.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ElevatedButtonn(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(AppTexts.heveAccount),
            TextButton(
              onPressed: () {},
              child: const Text(AppTexts.signUp),
            ),
          ],
        )
      ],
    );
  }
}
