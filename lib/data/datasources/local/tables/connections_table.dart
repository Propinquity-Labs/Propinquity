import "package:drift/drift.dart";

class ConnectionsTable extends Table {
  IntColumn get connectionsId =>
      integer().named("connections_id").autoIncrement()();
  Column<String> get connectionsName => text().named("connections_name")();
  Column<String> get contactFrequency => text().named("contact_frequency")();
  Column<String> get connectionsRelation =>
      text().named("connections_relation")();
  Column<Uint8List> get image => blob().nullable()();
  IntColumn get streak => integer().clientDefault(() => 0)();
  IntColumn get calculatedScore =>
      integer().nullable().named("calculated_score")();
  Column<bool> get checkIn =>
      boolean().named("check_in").withDefault(const Constant<bool>(false))();
  Column<DateTime> get deletedAt => dateTime().nullable().named("deleted_at")();
}
