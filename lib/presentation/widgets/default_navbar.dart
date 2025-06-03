import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/providers/navigation_provider.dart";

import "../../application/state/navigation_controller.dart";

class CurvedIconBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height);
    var x = 0.0;
    var numberOfWaves = 2;
    var increment = size.width / numberOfWaves;
    bool startFromTop = true;

    path.lineTo(x, 0);
    path.cubicTo(x + increment / 2, 0, x + increment / 2, size.height,
        x + increment, size.height);

    x += increment;

    path.lineTo(x, size.height);
    path.cubicTo(
        x + increment / 2, size.height, x + increment / 2, 0, x + increment, 0);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Defines current index, simple state
final StateProvider<int> currentTabProvider =
    StateProvider<int>((Ref<int> ref) => 0);

class DefaultNavBar extends ConsumerWidget {
  const DefaultNavBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(navigationProvider);
    final nav = ref.read(navigationProvider.notifier);
    void onTapped(int index) {
      ref.read(currentTabProvider.notifier).state = index;
    }

    Widget buildTap(AppPage page, IconData icon, String label) {
      final isSelected = currentPage == page;

      return GestureDetector(
        onTap: () => nav.goTo(page),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AnimatedContainer(
                  width: isSelected ? 100 : 0,
                  height: isSelected ? 60 : 0,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                  child: Transform.translate(
                    offset: const Offset(0, -1),
                    child: ClipPath(
                      clipper: CurvedIconBackground(),
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Icon(icon,
                    color: isSelected ? Colors.black54 : Colors.white,
                    semanticLabel: label)
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      height: 60,
      clipBehavior: Clip.none,
      decoration: const BoxDecoration(color: Color.fromRGBO(234, 43, 121, 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildTap(AppPage.home, Icons.home_rounded, "Home"),
          buildTap(
              AppPage.addConnection, Icons.add_circle_outline_rounded, "Add"),
          buildTap(AppPage.settings, Icons.settings, "Settings")
        ],
      ),
    );
  }
}
