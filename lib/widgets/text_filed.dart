import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';

class TextFielld extends StatelessWidget {
  final String labelText;
  TextFielld({super.key, required this.labelText});
  final ValueNotifier<bool> isVisibilty = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    final bool isPassword = labelText == AppTexts.labelPassword;
    return ValueListenableBuilder(
        valueListenable: isVisibilty,
        builder: (context, value, _) {
          return TextField(
            obscureText: isPassword ? isVisibilty.value : false,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: labelText,
                suffixIcon: isPassword
                    ? IconButton(
                        onPressed: () {
                          isVisibilty.value = !isVisibilty.value;
                        },
                        icon: Icon(isVisibilty.value
                            ? Icons.visibility
                            : Icons.visibility_off))
                    : null,
                prefixIcon: Icon(
                  isPassword ? Icons.password : Icons.email,
                  size: 22,
                )),
          );
        });
  }
}
