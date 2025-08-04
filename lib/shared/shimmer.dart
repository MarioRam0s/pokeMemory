import 'package:flutter/material.dart';
import 'package:pokememory/utils/const_desing.dart';
import 'package:shimmer/shimmer.dart' show Shimmer;

class ShimmerShared extends StatelessWidget {
  final double? width;
  const ShimmerShared({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: $colorBaseShimmer,
      highlightColor: $highlightColorShimmer,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 15,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: $white,
        ),
      ),
    );
  }
}
