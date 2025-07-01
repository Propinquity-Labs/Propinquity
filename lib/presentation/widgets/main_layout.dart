import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

class MainLayout extends ConsumerWidget {
  const MainLayout({super.key, required this.title, required this.body});
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    context.canPop();
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          children: <Widget>[
            if (context.canPop())
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                  child: IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back_rounded)),
                ),
              ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, context.canPop() ? 0 : 20, 0, 0),
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.fromLTRB(30, context.canPop() ? 0 : 60, 30, 0),
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
          ],
        ));
  }
}
