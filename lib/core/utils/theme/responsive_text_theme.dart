import 'package:base_project/core/utils/app_constance.dart';
import 'package:flutter/material.dart';

abstract class ResponsiveTextTheme {
  const ResponsiveTextTheme._();

  static double getFontSize(BuildContext ctx, double baseSize) =>
      baseSize * getScaleFactor(ctx);

  static double getScaleFactor(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    late double scaleFactor;
    if (width < AppConstance.mobileWidth) {
      scaleFactor = width / 400;
    } else if (width < AppConstance.tabletWidth) {
      scaleFactor = width / 700;
    } else {
      scaleFactor = width / 1000;
    }
    return scaleFactor.clamp(0.8, 1.5);
  }
}
