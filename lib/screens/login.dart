import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/image.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/widgets/button.dart';
import 'package:integration_flutter_rocket/widgets/text_filed.dart';
import 'package:integration_flutter_rocket/widgets/title_auth.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        reverse: true,
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 4,
                child: Image(
                  image: AssetImage(AppAssets.vectorLogin),
                ),
              ),
              const Expanded(
                child: TitleAuth(title: AppTexts.titleLogin),
              ),
              Expanded(
                child: TextFielld(
                  labelText: AppTexts.labelEmail,
                ),
              ),
              Expanded(child: TextFielld(labelText: AppTexts.labelPassword)),
              const Buttons(
                title: AppTexts.signUp,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
