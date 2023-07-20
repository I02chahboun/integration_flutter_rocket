import 'package:flutter/material.dart';
import 'package:flutter_rocket/flutter_rocket.dart';
import 'package:integration_flutter_rocket/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    const String baseUrlPost =
        "http://restapi.adequateshop.com/api/authaccount";
    RocketClient requestUser = RocketClient(url: baseUrlPost);
    Rocket.add<RocketClient>(key: "post", requestUser, readOnly: true);

    const String baseUrlGet = "https://dummyjson.com";
    RocketClient requestProduct = RocketClient(url: baseUrlGet);
    Rocket.add<RocketClient>(key: "get", requestProduct);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const LogIn(),
    );
  }
}
