import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/color.dart';
import 'package:integration_flutter_rocket/constants/util.dart';
import 'package:integration_flutter_rocket/models/product.dart';
import 'package:integration_flutter_rocket/screens/product_details.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  const CardProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(ProductDetails(
          product: product,
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(child: Image(image: NetworkImage(product.thumbnail!))),
            Text(
              product.title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              product.description!,
              style: const TextStyle(fontSize: 14, color: AppColors.grey),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "price: ${product.price}\$",
              style: const TextStyle(
                  fontSize: 17,
                  color: AppColors.green,
                  fontWeight: FontWeight.w700),
            ),
          ]),
        ),
      ),
    );
  }
}
