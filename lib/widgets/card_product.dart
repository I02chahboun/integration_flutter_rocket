import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/color.dart';

class CardProduct extends StatelessWidget {
  final String image, title, description;
  final int price;
  const CardProduct(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Image.network(
              image,
              width: 70,
              height: 70,
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 14, color: AppColors.grey),
          ),
          Text(
            "price: $price\$",
            style: const TextStyle(
                fontSize: 17,
                color: AppColors.green,
                fontWeight: FontWeight.w700),
          ),
        ]),
      ),
    );
  }
}
