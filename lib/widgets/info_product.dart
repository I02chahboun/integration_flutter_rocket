import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/color.dart';
import 'package:integration_flutter_rocket/models/product.dart';

class InfoProduct extends StatelessWidget {
  final Product product;
  const InfoProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          Text(
            product.description!,
            style: const TextStyle(fontSize: 16, color: AppColors.grey),
          ),
          Text(
            "price: ${product.price}\$",
            style: const TextStyle(
                fontSize: 18,
                color: AppColors.green,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
