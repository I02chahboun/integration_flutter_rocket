import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/widgets/appbar.dart';
import 'package:integration_flutter_rocket/widgets/card_product.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarr(context),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          itemCount: 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return const CardProduct(
              image:
                  "https://mobizil.com/wp-content/uploads/2020/02/Samsung-Galaxy-S20.jpg",
              title: "Phone S20",
              description: "the is Phone S20",
              price: 30.0,
            );
          },
        ),
      ),
    );
  }
}
