import "package:drift/native.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_test/flutter_test.dart";
import "package:propinquity/application/providers/database_provider.dart";
import "package:propinquity/data/datasources/local/daos/connections_dao.dart";
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

  testWidgets("Click on connection and verify data is present",
      (WidgetTester tester) async {
    final ConnectionsDAO dao = db.connectionsDAO;
    await dao.insertExampleData();
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text("Good Larry").first);
    await tester.pumpAndSettle();
    expect(find.text("Good Larry"), findsOneWidget);
    expect(find.text("Friends"), findsOneWidget);
    expect(find.text("Weekly"), findsOneWidget);
    expect(find.text("1990-01-01"), findsOneWidget);
    expect(find.text("test@example.com"), findsOneWidget);
    expect(find.text("555-1234"), findsOneWidget);
    expect(find.text("69/100"), findsOneWidget);
  });
}
