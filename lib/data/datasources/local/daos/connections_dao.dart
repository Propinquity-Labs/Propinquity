import "dart:async";

import "package:drift/drift.dart";
import "package:flutter/services.dart";
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
    final Uint8List larryImage =
        (await rootBundle.load("lib/assets/test_images/test_2_1_larry.png"))
            .buffer
            .asUint8List();

    final Uint8List jamesImage =
        (await rootBundle.load("lib/assets/test_images/test_2_2_james.png"))
            .buffer
            .asUint8List();

    final Uint8List creatureImage = (await rootBundle
            .load("lib/assets/test_images/test_2_3_the_creature.png"))
        .buffer
        .asUint8List();

    int connectionId = await into(connectionsTable).insert(
        ConnectionsTableCompanion(
            connectionsId: const Value<int>(1),
            connectionsName: const Value<String>("Good Larry"),
            contactFrequency: const Value<String>("Weekly"),
            connectionsRelation: const Value<String>("Friends"),
            image: Value<Uint8List?>(larryImage)),
        mode: InsertMode.insertOrReplace);

    List<ConnectionsFieldsTableCompanion> fields =
        <ConnectionsFieldsTableCompanion>[
      ConnectionsFieldsTableCompanion(
        fieldId: const Value<int>(1),
        connectionsId: Value<int>(connectionId),
        fieldType: const Value<String>("email"),
        fieldValue: const Value<String>("test@example.com"),
        fieldOrder: const Value<int>(0),
      ),
      ConnectionsFieldsTableCompanion(
        fieldId: const Value<int>(2),
        connectionsId: Value<int>(connectionId),
        fieldType: const Value<String>("phone"),
        fieldValue: const Value<String>("555-1234"),
        fieldOrder: const Value<int>(1),
      ),
      ConnectionsFieldsTableCompanion(
        fieldId: const Value<int>(3),
        connectionsId: Value<int>(connectionId),
        fieldType: const Value<String>("birthday"),
        fieldValue: const Value<String>("1990-01-01"),
        fieldOrder: const Value<int>(2),
      ),
    ];

    // 3. Insert all fields
    for (final ConnectionsFieldsTableCompanion field in fields) {
      await into(connectionsFieldsTable)
          .insert(field, mode: InsertMode.insertOrReplace);
    }

    connectionId = await into(connectionsTable).insert(
        ConnectionsTableCompanion(
            connectionsId: const Value<int>(2),
            connectionsName: const Value<String>("James"),
            contactFrequency: const Value<String>("Monthly"),
            connectionsRelation: const Value<String>("Rival"),
            image: Value<Uint8List?>(jamesImage)),
        mode: InsertMode.insertOrReplace);

    fields = <ConnectionsFieldsTableCompanion>[
      ConnectionsFieldsTableCompanion(
        fieldId: const Value<int>(4),
        connectionsId: Value<int>(connectionId),
        fieldType: const Value<String>("email"),
        fieldValue: const Value<String>("test@example.com"),
        fieldOrder: const Value<int>(0),
      ),
      ConnectionsFieldsTableCompanion(
        fieldId: const Value<int>(5),
        connectionsId: Value<int>(connectionId),
        fieldType: const Value<String>("phone"),
        fieldValue: const Value<String>("250-555-1234"),
        fieldOrder: const Value<int>(1),
      ),
      ConnectionsFieldsTableCompanion(
        fieldId: const Value<int>(6),
        connectionsId: Value<int>(connectionId),
        fieldType: const Value<String>("birthday"),
        fieldValue: const Value<String>("1991-06-15"),
        fieldOrder: const Value<int>(2),
      ),
    ];

    // 3. Insert all fields
    for (final ConnectionsFieldsTableCompanion field in fields) {
      await into(connectionsFieldsTable)
          .insert(field, mode: InsertMode.insertOrReplace);
    }

    connectionId = await into(connectionsTable).insert(
        ConnectionsTableCompanion(
            connectionsId: const Value<int>(3),
            connectionsName: const Value<String>("The Creature"),
            contactFrequency: const Value<String>("Daily"),
            connectionsRelation: const Value<String>("Mystery"),
            image: Value<Uint8List?>(creatureImage)),
        mode: InsertMode.insertOrReplace);

    fields = <ConnectionsFieldsTableCompanion>[
      ConnectionsFieldsTableCompanion(
        fieldId: const Value<int>(7),
        connectionsId: Value<int>(connectionId),
        fieldType: const Value<String>("email"),
        fieldValue: const Value<String>("theCreature@example.com"),
        fieldOrder: const Value<int>(0),
      ),
      ConnectionsFieldsTableCompanion(
        fieldId: const Value<int>(8),
        connectionsId: Value<int>(connectionId),
        fieldType: const Value<String>("phone"),
        fieldValue: const Value<String>("250-555-1234"),
        fieldOrder: const Value<int>(1),
      ),
      ConnectionsFieldsTableCompanion(
        fieldId: const Value<int>(9),
        connectionsId: Value<int>(connectionId),
        fieldType: const Value<String>("birthday"),
        fieldValue: const Value<String>("2025-07-10"),
        fieldOrder: const Value<int>(2),
      ),
    ];

    // 3. Insert all fields
    for (final ConnectionsFieldsTableCompanion field in fields) {
      await into(connectionsFieldsTable)
          .insert(field, mode: InsertMode.insertOrReplace);
    }
  }
}
