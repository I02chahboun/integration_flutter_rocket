import 'package:flutter/material.dart';
import 'package:flutter_rocket/flutter_rocket.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/models/product.dart';
import 'package:integration_flutter_rocket/services/rocket_requests.dart';
import 'package:integration_flutter_rocket/widgets/appbar.dart';
import 'package:integration_flutter_rocket/widgets/card_product.dart';

class Home extends StatelessWidget {
  final Product products = Product();
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarr(
        context,
        title: AppTexts.home,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: RocketView<Product>(
            call: () => Request.get(products),
            model: products,
            loader: const CircularProgressIndicator(),
            builder: (context, state) {
              return GridView.builder(
                itemCount: products.all!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  final Product product = products.all![index];
                  return CardProduct(
                    product: product,
                  );
                },
              );
            }),
      ),
    );
  }
}
