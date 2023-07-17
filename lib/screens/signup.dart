import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/image.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/widgets/button.dart';
import 'package:integration_flutter_rocket/widgets/register_textfields.dart';
import 'package:integration_flutter_rocket/widgets/title_auth.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 5,
                    child: Image(image: AssetImage(AppAssets.vectorSignUp))),
                Expanded(child: TitleAuth(title: AppTexts.titleSignUp)),
                Expanded(flex: 3, child: Register()),
                Buttons(
                  title: AppTexts.signin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
