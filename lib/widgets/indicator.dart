import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderProducts extends StatelessWidget {
  const SliderProducts(
      {super.key, required this.controller, required this.count});
  final PageController controller;
  final int count;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      effect: const ExpandingDotsEffect(
        expansionFactor: 4,
        dotHeight: 6,
        dotWidth: 6,
      ),
      controller: controller,
      count: count,
    );
  }
}
