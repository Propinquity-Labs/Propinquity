// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:propinquity/main.dart";

void main() {
  testWidgets("Tests the home page", (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    expect(find.text("Home"), findsOneWidget);
  });

  testWidgets("Tests navigating through navbar", (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    expect(find.text("Hi, how's it going!"), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add_rounded));
    await tester.pump();

    expect(find.text("Add a Connection"), findsOneWidget);

    await tester.tap(find.byIcon(Icons.settings_rounded));
    await tester.pump();

    expect(find.text("Settings"), findsOneWidget);

    await tester.tap(find.byIcon(Icons.home_rounded));
    await tester.pump();

    expect(find.text("Hi, how's it going!"), findsOneWidget);
  });
}
