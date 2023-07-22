import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/color.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({super.key, required this.image, required this.description});
  final String image, description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AspectRatio(
          aspectRatio: 1,
          child: Hero(
              transitionOnUserGestures: true,
              tag: image,
              child: Image.network(image)),
        ),
        Text(
          description,
          style: const TextStyle(color: AppColors.grey, fontSize: 18),
        )
      ]),
    );
  }
}
