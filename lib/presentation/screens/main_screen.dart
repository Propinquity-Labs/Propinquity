import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/presentation/screens/home_screen.dart";
import "package:propinquity/presentation/screens/modify_screen.dart";
import "package:propinquity/presentation/screens/settings_screen.dart";
import "package:propinquity/presentation/widgets/default_navbar.dart";

import "../../application/providers/navigation_provider.dart";
import "../../application/state/navigation_controller.dart";

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

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
          return Center(child: Text("Unknown Page"));
      }
    }

    return Scaffold(
      body: Center(
        child: getPage(currentPage),
      ),
      bottomNavigationBar:
          ref.read(navigationProvider.notifier).isTabPage(currentPage)
              ? const DefaultNavBar()
              : null,
    );
  }
}
