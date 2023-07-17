import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';

class TextFielld extends StatelessWidget {
  final String labelText;
  const TextFielld({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    final bool isPassword = labelText == AppTexts.labelPassword;
    return TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          suffixIcon: isPassword ? const Icon(Icons.visibility) : null,
          prefixIcon: Icon(
            isPassword ? Icons.password : Icons.email,
            size: 22,
          )),
    );
  }
}
