import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

enum AppPage { home, addConnection, settings, none }

class NavigationController extends StateNotifier<AppPage> {
  final GoRouter _router;
  NavigationController(this._router) : super(AppPage.home);

  void goTo(AppPage page) {
    switch (page) {
      case AppPage.home:
        _router.go("/");
        break;
      case AppPage.addConnection:
        _router.go("/add");
        break;
      case AppPage.settings:
        _router.go("/settings");
        break;
      case AppPage.none:
        break;
    }
    state = page;
  }

  bool isTabPage(AppPage page) {
    return page == AppPage.home ||
        page == AppPage.addConnection ||
        page == AppPage.settings;
  }
}
