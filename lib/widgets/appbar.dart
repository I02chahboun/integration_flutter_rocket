import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';

class AppBarr extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  const AppBarr(this.context, {super.key});
  @override
  Size get preferredSize => Size(MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height * 0.06);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        AppTexts.home,
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}
