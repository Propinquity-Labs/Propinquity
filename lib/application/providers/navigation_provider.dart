import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/providers/go_router_provider.dart";
import "package:propinquity/application/state/navigation_controller.dart";

final navigationProvider =
    StateNotifierProvider<NavigationController, AppPage>((ref) {
  final router = ref.watch(goRouterProvider);
  return NavigationController(router);
});
