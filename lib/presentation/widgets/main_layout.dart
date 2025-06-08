import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class MainLayout extends ConsumerWidget {
  const MainLayout({super.key, required this.title, required this.body});
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
                    style: Theme.of(context).textTheme.displayLarge,
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
