import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/providers/navigation_provider.dart";

import "../../application/state/navigation_controller.dart";

class CurvedIconBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    final double height = size.height * 0.92;

    path.lineTo(0, height);
    double x = 0.0;
    final numberOfWaves = 2;
    var increment = size.width / numberOfWaves;

    path.lineTo(x, 0);
    path.cubicTo(20.0, 0, 20.0, height, 40.0, height);

    print(
        "Numbers: ${0 + increment / 2}, ${x + increment / 2}, ${x + increment}");

    x += increment;

    path.lineTo(x, height);
    path.cubicTo(60.0, height, 60.0, 0, 80.0, 0);

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
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                    begin: isSelected ? 1.0 : 0,
                    end: isSelected ? 1.0 : 0,
                  ),
                  duration: const Duration(milliseconds: 300),
                  builder: (BuildContext context, double scale, Widget? child) {
                    return AnimatedSlide(
                      offset: isSelected ? Offset.zero : const Offset(0, -1),
                      duration: const Duration(milliseconds: 300),
                      child: Transform.scale(
                        scale: scale,
                        child: Transform.translate(
                          offset: const Offset(0, -1),
                          child: ClipPath(
                            clipper: CurvedIconBackground(),
                            child: Container(
                              width: 80,
                              height: 60,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
      clipBehavior: Clip.hardEdge,
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
