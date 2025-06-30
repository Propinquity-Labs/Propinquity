import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:propinquity/application/providers/connections_provider.dart";
import "package:propinquity/application/providers/go_router_provider.dart";
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
    final router = ref.watch(goRouterProvider);

    return MainLayout(
      title: "Hi, how's it going!",
      body: Column(
        children: <Widget>[
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
                                    "/contact?id=${contact.connectionsId}");
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
      ),
    );
  }
}
