import "package:drift/drift.dart";
import "package:propinquity/data/datasources/local/tables/connections_table.dart";

class DatesTable extends Table {
  IntColumn get uid => integer().autoIncrement()();
  IntColumn get connectionsId => integer().named("connections_id").references(
      ConnectionsTable, #connectionsId,
      onDelete: KeyAction.cascade)();
  Column<String> get title => text()();
  Column<DateTime> get created => dateTime()();
  Column<DateTime> get lastModified => dateTime().named("last_modified")();
  Column<DateTime> get dtstart => dateTime()();
  Column<DateTime> get dtend => dateTime()();
  Column<DateTime> get dtstamp => dateTime()();
  Column<String> get rrule => text().nullable()();
  IntColumn get sequence => integer()();
  Column<String> get timezone => text().nullable()();
  Column<DateTime> get deletedAt => dateTime().nullable().named("deleted_at")();
}
