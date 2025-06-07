import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/providers/database_provider.dart";
import "package:propinquity/data/datasources/local/daos/connections_dao.dart";
import "package:propinquity/data/datasources/local/drift_database.dart";

final Provider<ConnectionsDAO> connectionsDaoProvider =
    Provider<ConnectionsDAO>((Ref<ConnectionsDAO> ref) {
  final AppDatabase db = ref.watch(dbProvider);
  return db.connectionsDAO;
});
