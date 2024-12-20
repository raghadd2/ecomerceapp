import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/utils/app_assets.dart';
import 'package:base_project/core/utils/app_extension.dart';
import 'package:base_project/features/dashboard/controller/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NavBarWidget extends ConsumerWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(dashboardProvider);
    return Container(
      color: Colors.white,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            padding: 30.allPad,
            icon: SvgPicture.asset(
              AppIcons.homeicon,
              colorFilter: index == 0
                  ? ColorFilter.mode(Color(0xff614FE0), BlendMode.srcIn)
                  : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            onPressed: () {
              if (index == 0) return;
              ref.watch(dashboardProvider.notifier).changeIndex(0);
              context.goNamed(NameRoutes.defaultNameRoute);
            },
          ),
          IconButton(
            padding: 30.allPad,
            icon: SvgPicture.asset(
              AppIcons.marketicon,
              colorFilter: index == 1
                  ? ColorFilter.mode(Color(0xff614FE0), BlendMode.srcIn)
                  : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            onPressed: () {
              if (index == 1) return;
              ref.watch(dashboardProvider.notifier).changeIndex(1);
              context.goNamed(NameRoutes.marketNameRoute);
            },
          ),
          IconButton(
            padding: 30.allPad,
            icon: SvgPicture.asset(
              AppIcons.profileicon,
              colorFilter: index == 2
                  ? ColorFilter.mode(Color(0xff614FE0), BlendMode.srcIn)
                  : ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            onPressed: () {
              if (index == 2) return;
              ref.watch(dashboardProvider.notifier).changeIndex(2);
              context.goNamed(NameRoutes.profileNameRoute);
            },
          ),
        ],
      ),
    );
  }
}
