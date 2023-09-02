import 'package:flutter/material.dart';
import 'package:flutter_rocket/flutter_rocket.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/constants/util.dart';

class TextFielld extends StatelessWidget {
  final String labelText;
  final Function(String)? onChanged;
  TextFielld({super.key, required this.labelText, required this.onChanged});
  final RocketValue<bool> isVisibilty = true.mini;
  @override
  Widget build(BuildContext context) {
    final bool isPassword = labelText == AppTexts.labelPassword ||
        labelText == AppTexts.confirmPassword;
    return RocketMiniView(
        value: isVisibilty,
        builder: () {
          return TextFormField(
              onChanged: onChanged,
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
              validator: (value) {
                if (value!.isEmpty) {
                  return AppTexts.fieldRequired;
                }
                return validator()?.call(value);
              });
        });
  }

  String? Function(String?)? validator() {
    switch (labelText) {
      case AppTexts.labelEmail:
        return Validate.errorEmail;

      case AppTexts.labelPassword:
        return Validate.errorPassword;
      default:
        return Validate.errorConfirmPassword;
    }
  }
}
