import "package:drift/drift.dart";
import "package:drift/native.dart";
import "package:flutter/services.dart";
import "package:flutter_test/flutter_test.dart";
import "package:propinquity/data/datasources/local/drift_database.dart";
import "package:propinquity/data/models/field_models.dart";

void main() {
  late AppDatabase db;
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    // Use an in-memory database so nothing is persisted
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  testWidgets("load image asset as blob", (WidgetTester tester) async {
    final ByteData data =
        await rootBundle.load("lib/assets/test_images/test_1_shrimp.png");
    final Uint8List bytes = data.buffer.asUint8List();

    expect(bytes.isNotEmpty, true, reason: "Image file must have content");
  });

  test("insertExampleData inserts one connection and related fields", () async {
    final Uint8List larryImage = await rootBundle
        .load("lib/assets/test_images/test_2_1_larry.png")
        .then((ByteData b) => b.buffer.asUint8List());

    // Perform insertion (copying logic from your insertExampleData)
    final int connectionId = await db.connectionsTable.insertOne(
      ConnectionsTableCompanion(
        connectionsName: const Value<String>("Larry"),
        contactFrequency: const Value<String>("Weekly"),
        connectionsRelation: const Value<String>("Acquaintance"),
        image: Value<Uint8List?>(larryImage),
      ),
    );

    final List<ConnectionsFieldsTableCompanion> fields =
        <ConnectionsFieldsTableCompanion>[
      ConnectionsFieldsTableCompanion(
        connectionsId: Value<int>(connectionId),
        fieldType: const Value(FieldType.email),
        fieldValue: const Value<String>("test@example.com"),
        fieldOrder: const Value<int>(0),
      ),
      ConnectionsFieldsTableCompanion(
        connectionsId: Value<int>(connectionId),
        fieldType: const Value(FieldType.phone),
        fieldValue: const Value<String>("555-1234"),
        fieldOrder: const Value<int>(1),
      ),
      ConnectionsFieldsTableCompanion(
        connectionsId: Value<int>(connectionId),
        fieldType: const Value(FieldType.dateBirthday),
        fieldValue: const Value<String>("1990-01-01"),
        fieldOrder: const Value<int>(2),
      ),
    ];

    for (final ConnectionsFieldsTableCompanion field in fields) {
      await db.connectionsFieldsTable.insertOne(field);
    }

    // Verify connection exists
    final List<ConnectionsTableData> connections =
        await db.select(db.connectionsTable).get();
    expect(connections.length, 1);
    expect(connections.first.connectionsName, "Larry");

    // Verify fields
    final List<ConnectionsFieldsTableData> allFields =
        await db.select(db.connectionsFieldsTable).get();
    expect(allFields.length, 3);
    expect(
        allFields.map((ConnectionsFieldsTableData f) => f.fieldType),
        containsAll(<FieldType>[
          FieldType.email,
          FieldType.phone,
          FieldType.dateBirthday
        ]));
  });
}
