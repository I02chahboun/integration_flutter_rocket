import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/widgets/text_filed.dart';

class Register extends StatelessWidget {
  const Register({super.key, required this.formKey});
  final GlobalKey formKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: TextFielld(
          labelText: AppTexts.labelEmail,
        )),
        Expanded(
          child: TextFielld(
            labelText: AppTexts.labelPassword,
          ),
        ),
        Expanded(
          child: TextFielld(
            labelText: AppTexts.confirmPassword,
          ),
        ),
      ],
    );
  }
}
