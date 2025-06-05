import "package:drift/drift.dart";
import "package:propinquity/data/datasources/local/tables/connection_table.dart";

part "drift_database.g.dart";

@DriftDatabase(tables: [ConnectionItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => throw UnimplementedError();
}
