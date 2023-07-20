import 'package:flutter/material.dart';
import 'package:flutter_rocket/flutter_rocket.dart';
import 'package:integration_flutter_rocket/constants/image.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/constants/util.dart';
import 'package:integration_flutter_rocket/models/auth.dart';
import 'package:integration_flutter_rocket/screens/home.dart';
import 'package:integration_flutter_rocket/widgets/button.dart';
import 'package:integration_flutter_rocket/widgets/register_textfields.dart';
import 'package:integration_flutter_rocket/widgets/title_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final User post = User();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          reverse: true,
          child: IntrinsicHeight(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                      flex: 3,
                      child: AspectRatio(
                        aspectRatio: 3 / 2.38,
                        child: Image(
                          image: AssetImage(AppAssets.vectorSignUp),
                        ),
                      )),
                  const TitleAuth(title: AppTexts.titleSignUp),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      flex: 3,
                      child: Register(
                        formKey: formKey,
                      )),
                  RocketMiniView(
                      value: post,
                      builder: () {
                        return Buttons(
                          title: AppTexts.signin,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.push(Home());
                            }
                          },
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
