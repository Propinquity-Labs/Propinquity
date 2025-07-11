import "package:drift/native.dart";
import "package:flutter/services.dart";
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

  testWidgets("load image asset as blob", (WidgetTester tester) async {
    final ByteData data =
        await rootBundle.load("lib/assets/test_images/test_1_shrimp.png");
    final Uint8List bytes = data.buffer.asUint8List();

    expect(bytes.isNotEmpty, true, reason: "Image file must have content");
  });

  testWidgets("example data loading on main page", (WidgetTester tester) async {
    final ConnectionsDAO dao = db.connectionsDAO;
    await dao.insertExampleData();
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text("Good Larry"), findsNWidgets(2));
    expect(find.text("James"), findsOneWidget);
    expect(find.text("The Creature"), findsNWidgets(2));
  });
  testWidgets("test navigate to first connection", (WidgetTester tester) async {
    final ConnectionsDAO dao = db.connectionsDAO;
    await dao.insertExampleData();
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text("Good Larry").last);
    expect(find.text("Good Larry"), findsAny);
  });
}
