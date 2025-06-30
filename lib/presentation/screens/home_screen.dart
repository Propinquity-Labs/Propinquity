import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/providers/connections_provider.dart";
import "package:propinquity/data/datasources/local/drift_database.dart";
import "package:propinquity/presentation/widgets/connections_card.dart";
import "package:propinquity/presentation/widgets/main_layout.dart";

final connectionsListProvider =
    FutureProvider<List<ConnectionsTableData>>((ref) async {
  final dao = ref.watch(connectionsDaoProvider);
  return dao.getAllConnections();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO remove

    final connectionsAsync = ref.watch(connectionsListProvider);

    // TODO: implement build
    return MainLayout(
      title: "Hi, how's it going!",
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Now’s a great time to reconnect with a friend you’ve not talked to in a while! If you don’t know where to start, read more about some suggestions here!",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2),
            child: connectionsAsync.when(
              data: (connections) {
                if (connections.isEmpty) {
                  return const Center(child: Text("Nothing Found"));
                }
                return Column(
                    children: connections
                        .map((contact) => ConnectionsCard(
                              name: contact.connectionsName,
                              frequency: contact.contactFrequency,
                              relation: contact.connectionsRelation,
                              image: contact.image,
                              score: contact.calculatedScore,
                              onTap: () {Navigator.push(context, route)},
                            ))
                        .toList());
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
