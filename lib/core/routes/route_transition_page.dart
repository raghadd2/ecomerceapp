import 'package:base_project/core/utils/app_constance.dart';
import 'package:base_project/core/utils/enums/page_transition_type.dart';
import 'package:base_project/core/utils/public_methods.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<dynamic> routeTransitionPage({
  required BuildContext ctx,
  required GoRouterState state,
  required Widget page,
  PageTransitionType transitionType = PageTransitionType.slide,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: page,
    transitionDuration:
        const Duration(milliseconds: AppConstance.pageTransitionDuration),
    transitionsBuilder: (ctx, animation, secondaryAnimation, child) {
      switch (transitionType) {
        case PageTransitionType.slide:
          return SlideTransition(
            position: PublicMethods.isArabic(ctx)
                ? Tween<Offset>(
                    begin: const Offset(-1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation)
                : Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
            child: child,
          );
        case PageTransitionType.fade:
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        case PageTransitionType.scale:
          return ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(animation),
            child: child,
          );
        case PageTransitionType.rotation:
          return RotationTransition(
            turns: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(animation),
            child: child,
          );
        case PageTransitionType.size:
          return Align(
            child: SizeTransition(
              sizeFactor: animation,
              child: child,
            ),
          );
        default:
          return child;
      }
    },
  );
}
