import 'package:flutter/material.dart';
import 'package:naurs/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class RectangleShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double border;
  final Color secondaryColor;

  const RectangleShimmer({
    Key? key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.border = 10.0,
    this.secondaryColor = grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: secondaryColor,
      period: const Duration(seconds: 2),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(border),
        ),
      ),
    );
  }
}
