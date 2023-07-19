import 'package:flutter/material.dart';
import 'package:flutter_rocket/flutter_rocket.dart';
import 'package:integration_flutter_rocket/constants/api.dart';
import 'package:integration_flutter_rocket/constants/image.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/constants/util.dart';
import 'package:integration_flutter_rocket/models/auth.dart';
import 'package:integration_flutter_rocket/screens/home.dart';
import 'package:integration_flutter_rocket/widgets/button.dart';
import 'package:integration_flutter_rocket/widgets/register_textfields.dart';
import 'package:integration_flutter_rocket/widgets/title_auth.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final Post post = Post();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                    flex: 5,
                    child: Image(image: AssetImage(AppAssets.vectorSignUp))),
                const Expanded(child: TitleAuth(title: AppTexts.titleSignUp)),
                const Expanded(flex: 3, child: Register()),
                RocketMiniView(
                    value: post,
                    builder: () {
                      return Buttons(
                        title: AppTexts.signin,
                        onPressed: () {
                          _registerUser(context);
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _registerUser(BuildContext context) {
    final Map<String, dynamic> data = {
      "name": "Developer",
      "email": "Developer5@gmail.com",
      "password": 123456
    };
    Rocket.get<RocketClient>("post")
        .request(
          Api.register,
          model: post,
          data: data,
          method: HttpMethods.post,
        )
        .whenComplete(() => _validPost(context));
  }

  void _validPost(BuildContext context) {
    if (post.existData) {
      context.push(Home());
    } else {
      post.exception.response;
    }
  }
}
