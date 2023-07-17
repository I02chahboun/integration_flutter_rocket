import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/image.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/widgets/button.dart';
import 'package:integration_flutter_rocket/widgets/text_filed.dart';

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
                child: Text(
                  AppTexts.titleLogin,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                child: TextFielld(
                  labelText: AppTexts.labelEmail,
                ),
              ),
              Expanded(child: TextFielld(labelText: AppTexts.labelPassword)),
              const Buttons(),
              const Spacer(),
            ],
          ),
        ),
      ),
    ));
  }
}
