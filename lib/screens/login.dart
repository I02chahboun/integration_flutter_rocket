import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/image.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/constants/util.dart';
import 'package:integration_flutter_rocket/screens/home.dart';
import 'package:integration_flutter_rocket/widgets/button.dart';
import 'package:integration_flutter_rocket/widgets/text_filed.dart';
import 'package:integration_flutter_rocket/widgets/title_auth.dart';

// ignore: must_be_immutable
class LogIn extends StatelessWidget {
  LogIn({super.key});

  final formKey = GlobalKey<FormState>();
  late String _email, _password;
  final FirebaseAuth instance = FirebaseAuth.instance;
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
                    onChanged: (value) {
                      _email = value;
                    },
                    labelText: AppTexts.labelEmail,
                  ),
                ),
                Expanded(
                    child: TextFielld(
                  onChanged: (value) {
                    _password = value;
                  },
                  labelText: AppTexts.labelPassword,
                )),
                Buttons(
                  title: AppTexts.signUp,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await instance.signInWithEmailAndPassword(
                            email: _email, password: _password);
                        // ignore: use_build_context_synchronously
                        context.push(const Home());
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "invalid-email") {
                          showSnackbar(context, "invalid-email");
                        } else if (e.code == "user-disabled") {
                          showSnackbar(context, "user-disabled");
                        } else if (e.code == "user-not-found") {
                          showSnackbar(context, "user-not-found");
                        } else {
                          showSnackbar(context, "wrong-password");
                        }
                      }
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
