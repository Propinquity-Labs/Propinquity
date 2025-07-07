// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import "package:drift/native.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:propinquity/application/providers/database_provider.dart";
import "package:propinquity/data/datasources/local/drift_database.dart";
import "package:propinquity/main.dart";

void main() {
  late AppDatabase db;
  late ProviderContainer container;
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    final executor = NativeDatabase.memory();
    db = AppDatabase(executor);

    container = ProviderContainer(
      overrides: [
        dbProvider.overrideWithValue(db),
      ],
    );
  });

  tearDown(() async {
    await db.close();
    container.dispose();
  });

  testWidgets("Tests the home page", (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    expect(find.text("Hi, how's it going!"), findsOneWidget);
  });

  testWidgets("Tests navigating through navbar", (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    expect(find.text("Hi, how's it going!"), findsOneWidget);

    await tester.press(find.byIcon(Icons.add_circle_outline_rounded));
    await tester.pump();

    expect(find.text("Add a Connection"), findsOneWidget);

    await tester.press(find.byIcon(Icons.settings_rounded));
    await tester.pump();

    expect(find.text("Settings"), findsOneWidget);

    await tester.press(find.byIcon(Icons.home_rounded));
    await tester.pump();

    expect(find.text("Hi, how's it going!"), findsOneWidget);
  });
}
