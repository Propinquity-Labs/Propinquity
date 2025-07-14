import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/providers/connections_provider.dart";
import "package:propinquity/data/datasources/local/drift_database.dart";
import "package:propinquity/presentation/widgets/connection_information_card.dart";
import "package:propinquity/presentation/widgets/main_layout.dart";

import "../../data/datasources/local/daos/connections_dao.dart";

final connectionFieldProvider =
    StreamProvider.family<List<ConnectionsFieldsTableData>, int>((ref, id) {
  final ConnectionsDAO dao = ref.watch(connectionsDaoProvider);
  return dao.watchFieldsByConnectionID(id);
});

class ConnectionsScreen extends ConsumerWidget {
  const ConnectionsScreen({super.key, required this.connectionsObj});
  final ConnectionsTableData connectionsObj;
  final double size = 200;

  // TODO: Change size based on screen size

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<ConnectionsFieldsTableData>> asyncFields =
        ref.watch(connectionFieldProvider(connectionsObj.connectionsId));

    // TODO: implement build
    return MainLayout(
      title: connectionsObj.connectionsName,
      body: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (connectionsObj.image != null)
              Flexible(
                  flex: 1,
                  child: Container(
                    width: size,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.memory(
                          connectionsObj.image!,
                          width: size,
                          fit: BoxFit.fitWidth,
                        )),
                  )),
            Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                        child: ConnectionInformationCard(
                            bodyString: connectionsObj.connectionsRelation,
                            headerString: "Relationship to You:"),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                          child: ConnectionInformationCard(
                              bodyString: connectionsObj.contactFrequency,
                              headerString: "How Often You Communicate:"))
                    ],
                  ),
                ))
          ],
        ),
        Row(
          children: [
            asyncFields.when(
                data: (List<ConnectionsFieldsTableData> fields) {
                  return Column(
                    children: <Widget>[
                      ...fields.map((ConnectionsFieldsTableData field) {
                        return Column(
                          children: <Widget>[Text(field.fieldValue)],
                        );
                      })
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (Object error, StackTrace stackTrace) =>
                    Center(child: Text("Error: $error")))
          ],
        )
      ],
    );
  }
}
