import 'package:flutter/material.dart';
import 'package:flutter_rocket/flutter_rocket.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';

class TextFielld extends StatelessWidget {
  final String labelText;
  final String? Function(String?) validate;
  TextFielld({
    super.key,
    required this.labelText,
    required this.validate,
  });
  final RocketValue<bool> isVisibilty = true.mini;
  @override
  Widget build(BuildContext context) {
    final bool isPassword = labelText == AppTexts.labelPassword;
    return RocketMiniView(
        value: isVisibilty,
        builder: () {
          return TextFormField(
            keyboardType: isPassword
                ? TextInputType.visiblePassword
                : TextInputType.emailAddress,
            obscureText: isPassword ? isVisibilty.v : false,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: labelText,
                suffixIcon: isPassword
                    ? IconButton(
                        onPressed: () {
                          isVisibilty.v = !isVisibilty.v;
                        },
                        icon: Icon(isVisibilty.v
                            ? Icons.visibility_off
                            : Icons.visibility))
                    : null,
                prefixIcon: Icon(
                  isPassword ? Icons.password : Icons.email,
                  size: 22,
                )),
            validator: validate,
          );
        });
  }
}
