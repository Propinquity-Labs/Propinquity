import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/providers/navigation_provider.dart";
import "package:propinquity/application/state/navigation_controller.dart";
import "package:propinquity/presentation/screens/home_screen.dart";
import "package:propinquity/presentation/screens/modify_screen.dart";
import "package:propinquity/presentation/screens/settings_screen.dart";
import "package:propinquity/presentation/widgets/default_navbar.dart";

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key, required this.page});
  final AppPage page;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppPage currentPage = ref.watch(navigationProvider);

    Widget getPage(AppPage page) {
      switch (page) {
        case AppPage.home:
          return const HomeScreen();
        case AppPage.addConnection:
          return const ModifyScreen();
        case AppPage.settings:
          return const SettingsScreen();
        default:
          return const Center(child: Text("Unknown Page"));
      }
    }

    return Scaffold(
      body: getPage(currentPage),
      bottomNavigationBar:
          ref.read(navigationProvider.notifier).isTabPage(currentPage)
              ? const DefaultNavBar()
              : null,
    );
  }
}
