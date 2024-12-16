import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/core/routes/route_transition_page.dart';
import 'package:base_project/features/dashboard/view/market_tab/market_main.dart';
import 'package:base_project/features/dashboard/view/market_tab/new_stores.dart';
import 'package:base_project/features/dashboard/view/screens/dashboard_screen.dart';
import 'package:base_project/features/home/view/details_screen.dart';
import 'package:base_project/features/home/view/screens/home_screen.dart';
import 'package:base_project/features/profile/profile_screen.dart';
import 'package:base_project/features/save/save.dart';
import 'package:base_project/features/splash/view/screens/splash_screen.dart';
import 'package:base_project/foo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// NOTE :: @@@@ USE THE routeTransitionPage FUNCTION IF NEEDED TO ADD CUSTOM TRANSITION TO THE PAGE @@@@

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _homeShell = GlobalKey<NavigatorState>(debugLabel: 'first');
final _marketShell = GlobalKey<NavigatorState>(debugLabel: 'market');
final _profileShell = GlobalKey<NavigatorState>(debugLabel: 'profile');

final routeProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      navigatorKey: _rootNavigatorKey,
      redirect: (context, state) {
        print("Current Route: ${state.matchedLocation}");
        return null;
      },
      initialLocation: Routes.splashRoute,
      routes: [
        GoRoute(
          path: Routes.splashRoute,
          name: NameRoutes.splashNameRoute,
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: SplashScreen());
          },
        ),
        // DELETE THIS ROUTE
        GoRoute(
          path: Routes.deatilsRoute,
          name: NameRoutes.deatilsNameRoute,
          pageBuilder: (context, state) {
            final product = state.extra as Product;
            return routeTransitionPage(
              ctx: context,
              state: state,
              page: DetailsScreen(
                key: state.pageKey,
                product: product,
              ),
            );
          },
        ),
        GoRoute(
          path: Routes.saveRoute,
          name: NameRoutes.saveNameRoute,
          pageBuilder: (context, state) {
            final product = state.extra as Product;
            return NoTransitionPage(
                child: SaveItemPageScreen(
              product: product,
            ));
          },
        ),
        GoRoute(
          path: Routes.storesRoute,
          name: NameRoutes.storesNameRoute,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: NewStores());
          },
        ),

        // SHELL NAVIGATOR

        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return DashBoardScreen(navigatorShellKey: navigationShell);
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              navigatorKey: _homeShell,
              routes: <RouteBase>[
                GoRoute(
                  path: Routes.defaultRoute,
                  name: NameRoutes.defaultNameRoute,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(child: HomeScreen());
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _marketShell,
              routes: <RouteBase>[
                GoRoute(
                  path: Routes.marketRoute,
                  name: NameRoutes.marketNameRoute,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(child: MarketMain());
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _profileShell,
              routes: <RouteBase>[
                GoRoute(
                  path: Routes.profileRoute,
                  name: NameRoutes.profileNameRoute,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(child: ProfileScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      ]);
});
