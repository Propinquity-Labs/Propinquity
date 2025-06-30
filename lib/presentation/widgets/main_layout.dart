import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class MainLayout extends ConsumerWidget {
  const MainLayout(
      {super.key,
      required this.title,
      required this.body,
      this.canPop = false});
  final String title;
  final Widget body;
  final bool canPop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // <-- Better to wrap the layout in a Scaffold if you're not already
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 60),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ],
              ),
              body, // Just place the body directly
            ],
          ),
        ),
      ),
    );
  }
}
