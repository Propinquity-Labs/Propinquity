import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/data/datasources/local/drift_database.dart";
import "package:propinquity/presentation/screens/main_screen.dart";

void main() async {
  final AppDatabase db = AppDatabase();
  const bool shouldSeedTestData = true;

  if (shouldSeedTestData) {
    await db.connectionsDAO.insertExampleData();
  }

  runApp(const ProviderScope(child: MyApp()));
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
