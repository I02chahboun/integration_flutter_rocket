import 'package:flutter/material.dart';
import 'package:flutter_rocket/flutter_rocket.dart';
import 'package:integration_flutter_rocket/constants/api.dart';
import 'package:integration_flutter_rocket/constants/image.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/constants/util.dart';
import 'package:integration_flutter_rocket/models/auth.dart';
import 'package:integration_flutter_rocket/screens/home.dart';
import 'package:integration_flutter_rocket/widgets/button.dart';
import 'package:integration_flutter_rocket/widgets/text_filed.dart';
import 'package:integration_flutter_rocket/widgets/title_auth.dart';

class LogIn extends StatelessWidget {
  final Post post = Post();
  LogIn({super.key});

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
                flex: 5,
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
              Buttons(
                title: AppTexts.signUp,
                onPressed: () {
                  context.push(Home());
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _post(BuildContext context) {
    Map<String, dynamic> data = {
      "email": "Developer5@gmail.com",
      "password": 123456,
    };
    Rocket.get<RocketClient>("post").request(Api.login,
        data: data,
        model: post,
        method: HttpMethods.post,
        params: {
          'Authorization': 'Bearer <token>'
        }).whenComplete(() => _validLogin(context));
  }

  void _validLogin(BuildContext context) {
    if (post.existData) {
      context.push(Home());
    } else {
      post.exception.response;
    }
  }
}
