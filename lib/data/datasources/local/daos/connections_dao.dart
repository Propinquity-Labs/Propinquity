import "dart:async";
import "dart:io";

import "package:drift/drift.dart";
import "package:propinquity/data/datasources/local/drift_database.dart";
import "package:propinquity/data/datasources/local/tables/connections_fields_table.dart";
import "package:propinquity/data/datasources/local/tables/connections_table.dart";
import "package:propinquity/data/datasources/local/tables/dates_table.dart";

part "connections_dao.g.dart";

@DriftAccessor(
    tables: <Type>[ConnectionsTable, ConnectionsFieldsTable, DatesTable])
class ConnectionsDAO extends DatabaseAccessor<AppDatabase>
    with _$ConnectionsDAOMixin {
  ConnectionsDAO(super.db);

  Future<int> insertConnection(ConnectionsTableCompanion entity) =>
      into(connectionsTable).insert(entity);

  Future<List<ConnectionsTableData>> getAllConnections() =>
      select(connectionsTable).get();

  Future<int> deleteConnection(int id) => (delete(connectionsTable)
        ..where(($ConnectionsTableTable tbl) => tbl.connectionsId.equals(id)))
      .go();

  Stream<List<ConnectionsTableData>> watchAllConnections() =>
      select(connectionsTable).watch();

  Future<void> updateConnectionsWithFields(
      ConnectionsTableCompanion connectionsEntity,
      List<ConnectionsFieldsTableCompanion> fieldsEntityList,
      List<DatesTableCompanion> datesEntityList) {
    return transaction(() async {
      // Upsert main entry
      final int connectionId = await into(connectionsTable)
          .insert(connectionsEntity, mode: InsertMode.insertOrReplace);

      // Delete original fields from table
      (delete(connectionsFieldsTable)
        ..where(($ConnectionsFieldsTableTable conTbl) =>
            conTbl.connectionsId.equals(connectionId)));

      // Sort fields by their assigned order
      fieldsEntityList.sort((ConnectionsFieldsTableCompanion orderValue1,
          ConnectionsFieldsTableCompanion orderValue2) {
        return orderValue2.fieldOrder.value - orderValue1.fieldOrder.value;
      });

      // Inserts the fields into the database(pre-sorted)
      for (final ConnectionsFieldsTableCompanion fieldsEntity
          in fieldsEntityList) {
        await into(connectionsFieldsTable)
            .insert(fieldsEntity.copyWith(connectionsId: Value(connectionId)));
      }
    });
  }

  Future<void> insertExampleData() async {
    final File file = File("assets/test_images/test_1_shrimp.png");
    final Uint8List imageBytes = await file.readAsBytes();
    // 1. Insert connection and get its ID
    final int connectionId = await into(connectionsTable).insert(
      ConnectionsTableCompanion(
          connectionsName: const Value<String>("Harry Ron Franks"),
          contactFrequency: const Value<String>("Weekly"),
          connectionsRelation: const Value<String>("Acquaintance"),
          image: Value<Uint8List?>(imageBytes)),
    );

    // 2. Create fields WITH the connectionId
    final List<ConnectionsFieldsTableCompanion> fields =
        <ConnectionsFieldsTableCompanion>[
      ConnectionsFieldsTableCompanion(
        connectionsId: Value<int>(connectionId),
        fieldType: const Value<String>("email"),
        fieldValue: const Value<String>("test@example.com"),
        fieldOrder: const Value<int>(0),
      ),
      ConnectionsFieldsTableCompanion(
        connectionsId: Value<int>(connectionId),
        fieldType: const Value<String>("phone"),
        fieldValue: const Value<String>("555-1234"),
        fieldOrder: const Value<int>(1),
      ),
      ConnectionsFieldsTableCompanion(
        connectionsId: Value<int>(connectionId),
        fieldType: const Value<String>("birthday"),
        fieldValue: const Value<String>("1990-01-01"),
        fieldOrder: const Value<int>(2),
      ),
    ];

    // 3. Insert all fields
    for (final ConnectionsFieldsTableCompanion field in fields) {
      await into(connectionsFieldsTable).insert(field);
    }
  }
}
