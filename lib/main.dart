import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/providers/connections_provider.dart";
import "package:propinquity/application/providers/go_router_provider.dart";
import "package:propinquity/application/providers/theme_provider.dart";

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // required for async + Flutter bindings

  const bool shouldSeedTestData = true;

  // Create a pre-run Riverpod container
  final container = ProviderContainer();

  if (shouldSeedTestData) {
    final dao = container.read(connectionsDaoProvider);
    await dao.insertExampleData();
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: "Propinquity",
      theme: ref.watch(themeProvider),
      routerConfig: router,
    );
  }
}
