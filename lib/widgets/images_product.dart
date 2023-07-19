import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/widgets/indicator.dart';

class ImagesProduct extends StatelessWidget {
  final List<dynamic> images;
  final PageController controller = PageController();
  ImagesProduct({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: PageView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              final String image = images[index];
              return Image(
                image: NetworkImage(image),
                fit: BoxFit.contain,
              );
            },
          ),
        ),
        Expanded(
          child: SliderProducts(
            controller: controller,
            count: images.length,
          ),
        ),
      ],
    );
  }
}
