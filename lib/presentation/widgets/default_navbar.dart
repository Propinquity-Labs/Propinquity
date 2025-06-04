import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/providers/navigation_provider.dart";
import "package:propinquity/application/state/navigation_controller.dart";

class CurvedIconBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    final double height = size.height * 0.92;

    path.lineTo(0, height);
    final double increment = size.width / 2;

    path.lineTo(0, 0);
    path.cubicTo(increment / 2, 0, increment / 2, height, increment, height);

    path.lineTo(increment, height);
    path.cubicTo(increment + increment / 2, height, increment + increment / 2,
        0, increment * 2, 0);

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
    final AppPage currentPage = ref.watch(navigationProvider);
    final NavigationController nav = ref.read(navigationProvider.notifier);

    Widget buildTap(AppPage page, IconData icon, String label) {
      final bool isSelected = currentPage == page;

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
                              width: MediaQuery.sizeOf(context).width / 3,
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
                    size: 32,
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Color.fromRGBO(234, 43, 121, 1),
          Color.fromRGBO(234, 54, 128, 1)
        ]),
      ),
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
