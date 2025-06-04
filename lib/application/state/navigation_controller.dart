import "package:flutter_riverpod/flutter_riverpod.dart";

enum AppPage { home, addConnection, settings, none }

class NavigationController extends StateNotifier<AppPage> {
  NavigationController() : super(AppPage.home);

  void goTo(AppPage page) => state = page;

  bool isTabPage(AppPage page) {
    return page == AppPage.home ||
        page == AppPage.addConnection ||
        page == AppPage.settings;
  }
}
