import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/image.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/constants/util.dart';
import 'package:integration_flutter_rocket/models/auth.dart';
import 'package:integration_flutter_rocket/screens/home.dart';
import 'package:integration_flutter_rocket/widgets/button.dart';
import 'package:integration_flutter_rocket/widgets/text_filed.dart';
import 'package:integration_flutter_rocket/widgets/title_auth.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
                  flex: 4,
                  child: Image(
                    image: AssetImage(AppAssets.vectorLogin),
                  ),
                ),
                const TitleAuth(title: AppTexts.titleLogin),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TextFielld(
                    labelText: AppTexts.labelEmail,
                  ),
                ),
                Expanded(
                    child: TextFielld(
                  labelText: AppTexts.labelPassword,
                )),
                Buttons(
                  title: AppTexts.signUp,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.push(Home());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
