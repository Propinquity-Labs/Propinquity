import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/state/navigation_controller.dart";

final StateNotifierProvider<NavigationController, AppPage> navigationProvider =
    StateNotifierProvider<NavigationController, AppPage>(
  (Ref ref) => NavigationController(),
);
