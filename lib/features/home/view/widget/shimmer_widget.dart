
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class Shimmer_widget extends StatelessWidget {
  const Shimmer_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      direction: ShimmerDirection.fromLTRB(),
      child: Container(
        color: Colors.grey,
      ),
    );
  }
}
