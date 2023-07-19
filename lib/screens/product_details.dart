import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/models/product.dart';
import 'package:integration_flutter_rocket/widgets/appbar.dart';
import 'package:integration_flutter_rocket/widgets/images_product.dart';
import 'package:integration_flutter_rocket/widgets/info_product.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarr(
        context,
        title: AppTexts.product,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(children: [
          Expanded(
            child: ImagesProduct(
              images: product.images!,
            ),
          ),
          InfoProduct(product: product),
          const Spacer(),
        ]),
      ),
    );
  }
}
