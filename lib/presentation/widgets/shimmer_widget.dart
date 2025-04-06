import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmerpoc/utils/colors.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;
  const ShimmerWidget({
    super.key,
    this.width = double.infinity,
    this.height = 200,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
