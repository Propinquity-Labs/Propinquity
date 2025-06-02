import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/presentation/widgets/default_navbar.dart";
import "package:propinquity/presentation/widgets/nav_item.dart";

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
        body: const Center(
          child: Text("Testa"),
        ),
        bottomNavigationBar: DefaultNavBar(
          navItems: <NavItem>[NavItem()],
          color: Colors.red,
        ));
  }
}
