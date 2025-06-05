import "package:drift/drift.dart";

class ConnectionsTable extends Table {
  IntColumn get connectionsId =>
      integer().named("connections_id").autoIncrement()();
  Column<String> get connectionsName => text().named("connections_name")();
  Column<String> get contactFrequency => text().named("contact_frequency")();
  Column<String> get connectionsRelation =>
      text().named("connections_relation")();
  Column<Uint8List> get image => blob().nullable()();
  IntColumn get streak => integer().clientDefault(() => 1)();
  IntColumn get calculatedScore =>
      integer().nullable().named("calculated_score")();
  Column<bool> get checkIn =>
      boolean().named("check_in").withDefault(false as Expression<bool>)();
  Column<DateTime> get deletedAt => dateTime().nullable().named("deleted_at")();
}
