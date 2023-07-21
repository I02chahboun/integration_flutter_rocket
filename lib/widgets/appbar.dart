import 'package:flutter/material.dart';
import 'package:integration_flutter_rocket/constants/color.dart';
import 'package:integration_flutter_rocket/constants/texts.dart';
import 'package:integration_flutter_rocket/constants/util.dart';

class AppBarr extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final String title;
  const AppBarr(this.context, {super.key, required this.title});
  @override
  Size get preferredSize => Size(MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height * 0.06);
  @override
  Widget build(BuildContext context) {
    final bool isProductDetails = title == AppTexts.product;
    return AppBar(
      automaticallyImplyLeading: false,
      shadowColor: isProductDetails ? AppColors.trans : null,
      backgroundColor: isProductDetails ? AppColors.trans : null,
      foregroundColor: isProductDetails ? AppColors.trans : null,
      surfaceTintColor: isProductDetails ? AppColors.trans : null,
      leading: isProductDetails
          ? IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: AppColors.grey9,
              ),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.grey9,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: AppColors.grey9,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart,
            color: AppColors.grey9,
          ),
        ),
      ],
    );
  }
}
