import "package:drift/drift.dart";
import "package:drift_flutter/drift_flutter.dart";
import "package:propinquity/data/datasources/local/daos/connections_dao.dart";
import "package:propinquity/data/datasources/local/tables/connections_fields_table.dart";
import "package:propinquity/data/datasources/local/tables/connections_table.dart";
import "package:propinquity/data/datasources/local/tables/dates_table.dart";

part "drift_database.g.dart";

@DriftDatabase(
    tables: <Type>[ConnectionsTable, DatesTable, ConnectionsFieldsTable],
    daos: <Type>[ConnectionsDAO])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: "propinquity_database",
    );
  }
}
