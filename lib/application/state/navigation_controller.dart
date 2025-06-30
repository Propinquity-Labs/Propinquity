import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

enum AppPage { home, addConnection, settings, none }

class NavigationController extends StateNotifier<AppPage> {
  final GoRouter _router;
  NavigationController(this._router) : super(AppPage.home);

  void goTo(AppPage page) => state = page;

  bool isTabPage(AppPage page) {
    return page == AppPage.home ||
        page == AppPage.addConnection ||
        page == AppPage.settings;
  }
}
