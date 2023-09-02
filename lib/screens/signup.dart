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
class SignUp extends StatelessWidget {
  SignUp({super.key});

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
                      child: Column(
                        children: [
                          Expanded(
                              child: TextFielld(
                            onChanged: (value) {
                              _email = value;
                            },
                            labelText: AppTexts.labelEmail,
                          )),
                          Expanded(
                            child: TextFielld(
                              onChanged: (value) {
                                _password = value;
                              },
                              labelText: AppTexts.labelPassword,
                            ),
                          ),
                          Expanded(
                            child: TextFielld(
                              onChanged: (value) {},
                              labelText: AppTexts.confirmPassword,
                            ),
                          ),
                        ],
                      )),
                  Buttons(
                    title: AppTexts.signin,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          await instance.createUserWithEmailAndPassword(
                              email: _email, password: _password);
                          // ignore: use_build_context_synchronously
                          context.push(const Home());
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "email-already-in-use") {
                            showSnackbar(context, "email-already-in-use");
                          } else if (e.code == "invalid-email") {
                            showSnackbar(context, "invalid-email");
                          } else if (e.code == "operation-not-allowed") {
                            showSnackbar(context, "operation-not-allowed");
                          } else if (e.code == "weak-password") {
                            showSnackbar(context, "weak-password");
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
      ),
    );
  }
}
