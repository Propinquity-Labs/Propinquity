import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:propinquity/application/providers/connections_provider.dart";
import "package:propinquity/data/datasources/local/daos/connections_dao.dart";
import "package:propinquity/data/datasources/local/drift_database.dart";
import "package:propinquity/presentation/widgets/checkin_card.dart";
import "package:propinquity/presentation/widgets/connections_card.dart";
import "package:propinquity/presentation/widgets/main_layout.dart";

final FutureProvider<List<ConnectionsTableData>> connectionsListProvider =
    FutureProvider<List<ConnectionsTableData>>(
        (FutureProviderRef<List<ConnectionsTableData>> ref) async {
  final ConnectionsDAO dao = ref.watch(connectionsDaoProvider);
  return dao.getAllConnections();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO remove

    final AsyncValue<List<ConnectionsTableData>> connectionsAsync =
        ref.watch(connectionsListProvider);

    return MainLayout(
      title: "Hi, how's it going!",
      body: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "Now’s a great time to reconnect with someone you’ve not talked to in a while!",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2),
          child: connectionsAsync.when(
            data: (List<ConnectionsTableData> connections) {
              final List<ConnectionsTableData> checkInConnections = connections
                  .where(
                      (ConnectionsTableData connection) => connection.checkIn)
                  .toList();
              if (checkInConnections.isEmpty) {
                return const Center(child: Text("Nothing Found"));
              }
              return Column(
                children: <Widget>[
                  for (int i = 0; i < checkInConnections.length; i += 2)
                    Row(
                      children: <Widget>[
                        if (i < checkInConnections.length)
                          Expanded(
                            child: CheckinCard(
                              name: checkInConnections[i].connectionsName,
                              onTap: () {
                                context.push(
                                  "/contact?id=${checkInConnections[i].connectionsId}",
                                  extra: checkInConnections[i],
                                );
                              },
                              image: checkInConnections[i].image,
                              onTapCheck: () {},
                            ),
                          ),
                        if (i + 1 < checkInConnections.length)
                          Expanded(
                            child: CheckinCard(
                              name: checkInConnections[i + 1].connectionsName,
                              onTap: () {
                                context.push(
                                  "/contact?id=${checkInConnections[i + 1].connectionsId}",
                                  extra: checkInConnections[i + 1],
                                );
                              },
                              image: checkInConnections[i + 1].image,
                              onTapCheck: () {},
                            ),
                          ),
                        if (i + 1 >= checkInConnections.length)
                          const Expanded(
                            child: SizedBox(),
                          )
                      ],
                    ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (Object error, StackTrace stackTrace) =>
                Center(child: Text("Error: $error")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2),
          child: connectionsAsync.when(
            data: (List<ConnectionsTableData> connections) {
              if (connections.isEmpty) {
                return const Center(child: Text("Nothing Found"));
              }
              return Column(
                  children: connections
                      .map((ConnectionsTableData contact) => ConnectionsCard(
                            name: contact.connectionsName,
                            frequency: contact.contactFrequency,
                            relation: contact.connectionsRelation,
                            image: contact.image,
                            score: contact.calculatedScore,
                            onTap: () {
                              context.push(
                                  "/contact?id=${contact.connectionsId}",
                                  extra: contact);
                            },
                          ))
                      .toList());
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (Object error, StackTrace stackTrace) =>
                Center(child: Text("Error: $error")),
          ),
        ),
      ],
    );
  }
}
