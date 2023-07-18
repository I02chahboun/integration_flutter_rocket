import 'package:flutter/material.dart';

class AppBarr extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  const AppBarr(this.context, {super.key});
  @override
  Size get preferredSize => Size(MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height * 0.07);
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
