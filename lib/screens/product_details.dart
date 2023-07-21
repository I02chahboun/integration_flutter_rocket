import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/color.dart';
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
      backgroundColor: AppColors.beig,
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
          Expanded(flex: 2, child: InfoProduct(product: product)),
        ]),
      ),
    );
  }
}
