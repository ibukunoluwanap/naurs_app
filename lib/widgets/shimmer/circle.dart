import 'package:flutter/material.dart';
import 'package:naurs/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class CircleShimmer extends StatelessWidget {
  final double radius;

  const CircleShimmer({
    Key? key,
    this.radius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: grey,
      period: const Duration(seconds: 2),
      child: Container(
        width: radius,
        height: radius,
        decoration: const BoxDecoration(
          color: grey,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
