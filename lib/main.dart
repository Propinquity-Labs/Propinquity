import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/providers/connections_provider.dart";
import "package:propinquity/presentation/screens/main_screen.dart";

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // required for async + Flutter bindings

  const bool shouldSeedTestData = true;

  // Create a pre-run Riverpod container
  final container = ProviderContainer();

  if (shouldSeedTestData) {
    final dao = container.read(connectionsDaoProvider);
    await dao.insertExampleData(); // ✅ calls your DAO method directly
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
    return MaterialApp(
      title: "Propinquity",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
