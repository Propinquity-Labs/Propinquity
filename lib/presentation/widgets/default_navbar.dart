import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/presentation/widgets/nav_item.dart";

// Defines current index, simple state
final StateProvider<int> currentTabProvider =
    StateProvider<int>((Ref<int> ref) => 0);

class DefaultNavBar extends ConsumerWidget {
  const DefaultNavBar(
      {super.key,
      required this.navItems,
      required this.color,
      this.backgroundColor});
  final List<NavItem> navItems;

  final Color color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int index = ref.watch(currentTabProvider);
    void onTapped(int index) {
      ref.read(currentTabProvider.notifier).state = index;
    }

    return Container(
      height: 60,
      decoration: const BoxDecoration(color: Color.fromRGBO(234, 43, 121, 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: navItems,
      ),
    );
  }
}
