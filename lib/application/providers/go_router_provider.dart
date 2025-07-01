import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:propinquity/application/providers/authentication_provider.dart";
import "package:propinquity/data/datasources/local/drift_database.dart";
import "package:propinquity/presentation/screens/connections_screen.dart";
import "package:propinquity/presentation/screens/home_screen.dart";
import "package:propinquity/presentation/screens/modify_screen.dart";
import "package:propinquity/presentation/screens/settings_screen.dart";
import "package:propinquity/presentation/widgets/default_navbar.dart";

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final Provider<GoRouter> goRouterProvider =
    Provider<GoRouter>((Ref<GoRouter> ref) {
  final bool isLoggedIn = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: "/",
    routes: <RouteBase>[
      ShellRoute(
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return Scaffold(
                body: child, bottomNavigationBar: const DefaultNavBar());
          },
          routes: <RouteBase>[
            GoRoute(
              path: "/",
              pageBuilder: (BuildContext context, GoRouterState state) {
                return CustomTransitionPage(
                    child: const HomeScreen(),
                    transitionsBuilder: (_, __, ___, Widget child) => child);
              },
            ),
            GoRoute(
              path: "/add",
              pageBuilder: (BuildContext context, GoRouterState state) {
                return CustomTransitionPage(
                    child: const ModifyScreen(),
                    transitionsBuilder: (_, __, ___, Widget child) => child);
                ;
              },
            ),
            GoRoute(
              path: "/settings",
              pageBuilder: (BuildContext context, GoRouterState state) {
                return CustomTransitionPage(
                    child: const SettingsScreen(),
                    transitionsBuilder: (_, __, ___, Widget child) => child);
              },
            ),
            GoRoute(
                path: "/contact",
                builder: (BuildContext context, GoRouterState state) {
                  final ConnectionsTableData connectionsObj =
                      state.extra! as ConnectionsTableData;
                  return ConnectionsScreen(connectionsObj: connectionsObj);
                })
          ]),
      GoRoute(path: "/login", builder: (_, __) => const SettingsScreen()),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      if (!isLoggedIn) {
        return "/login";
      }
      return null;
    },
  );
});
