import 'package:flutter/material.dart';

class AppBarr extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final String title;
  const AppBarr(this.context, {super.key, required this.title});
  @override
  Size get preferredSize => Size(MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height * 0.06);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w700),
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
