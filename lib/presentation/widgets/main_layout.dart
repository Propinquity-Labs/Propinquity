import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

class MainLayout extends ConsumerWidget {
  const MainLayout({super.key, required this.title, required this.body});
  final String title;
  final List<Widget> body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    context.canPop();
    return Scaffold(
      appBar: context.canPop() ? AppBar(title: Text(title)) : null,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, context.canPop() ? 0 : 20, 0, 0),
        child: ListView(
          padding: EdgeInsets.fromLTRB(30, context.canPop() ? 0 : 60, 30, 0),
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            ...body
          ],
        ),
      ),
    );
  }
}
