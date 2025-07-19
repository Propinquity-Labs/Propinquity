import "package:drift/drift.dart";
import "package:propinquity/data/datasources/local/tables/connections_table.dart";
import "package:propinquity/data/models/field_models.dart";

class ConnectionsFieldsTable extends Table {
  IntColumn get fieldId => integer().named("field_id").autoIncrement()();
  IntColumn get connectionsId => integer().named("connections_id").references(
      ConnectionsTable, #connectionsId,
      onDelete: KeyAction.cascade)();
  IntColumn get fieldType => intEnum<FieldType>()();
  Column<String> get fieldValue => text().named("field_value")();
  Column<DateTime> get deletedAt => dateTime().nullable().named("deleted_at")();
  IntColumn get fieldOrder => integer().named("field_order")();

  @override
  List<Set<Column>> get uniqueKeys => <Set<Column<Object>>>[
        <Column<Object>>{connectionsId, fieldOrder},
      ];
}
