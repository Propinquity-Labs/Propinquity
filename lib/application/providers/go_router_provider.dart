import "package:flutter/widgets.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:propinquity/application/providers/authentication_provider.dart";
import "package:propinquity/application/state/navigation_controller.dart";
import "package:propinquity/presentation/screens/main_screen.dart";
import "package:propinquity/presentation/screens/settings_screen.dart";

final Provider<GoRouter> goRouterProvider =
    Provider<GoRouter>((Ref<GoRouter> ref) {
  final bool isLoggedIn = ref.watch(authProvider);
  return GoRouter(
    initialLocation: "/",
    routes: <RouteBase>[
      GoRoute(
          path: "/", builder: (_, __) => const MainScreen(page: AppPage.home)),
      GoRoute(
          path: "/add",
          builder: (_, __) => const MainScreen(page: AppPage.addConnection)),
      GoRoute(
          path: "/settings",
          builder: (_, __) => const MainScreen(page: AppPage.settings)),
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
