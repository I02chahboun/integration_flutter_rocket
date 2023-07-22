import 'package:flutter/material.dart';
import 'package:flutter_rocket/flutter_rocket.dart';
import 'package:integration_flutter_rocket/constants/color.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/constants/util.dart';
import 'package:integration_flutter_rocket/models/product.dart';
import 'package:integration_flutter_rocket/screens/show_image.dart';
import 'package:integration_flutter_rocket/widgets/filled_button.dart';

class InfoProduct extends StatelessWidget {
  final Product product;
  final RocketValue<bool> isFavorite = false.mini;
  InfoProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            thickness: MediaQuery.of(context).size.width * 0.01,
            indent: MediaQuery.of(context).size.width * 0.40,
            endIndent: MediaQuery.of(context).size.width * 0.40,
          ),
          RocketMiniView(
              value: isFavorite,
              builder: () {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    product.title!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  trailing: Text(
                    "\$${product.price}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                );
              }),
          Expanded(
            flex: 2,
            child: Text(
              product.description!,
              style: const TextStyle(fontSize: 16, color: AppColors.grey),
            ),
          ),
          const Expanded(
            child: Text(AppTexts.similar,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: product.images!.length,
              itemBuilder: (BuildContext context, int index) {
                final String image = product.images![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      context.push(ShowImage(
                          image: image, description: product.description!));
                    },
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: image,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: AppColors.grey)),
                        child: Image.network(image),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                RocketMiniView(
                    value: isFavorite,
                    builder: () {
                      return GestureDetector(
                        onTap: () {
                          isFavorite.v = !isFavorite.v;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.blue)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Icon(
                              isFavorite.v
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color:
                                  isFavorite.v ? AppColors.red : AppColors.grey,
                              size: 20,
                            ),
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(child: FilledButtonn()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
