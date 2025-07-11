import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:propinquity/application/providers/connections_provider.dart";
import "package:propinquity/data/datasources/local/daos/connections_dao.dart";
import "package:propinquity/data/datasources/local/drift_database.dart";
import "package:propinquity/presentation/widgets/connections_card.dart";
import "package:propinquity/presentation/widgets/main_layout.dart";

import "../widgets/checkin_card.dart";

final StreamProvider<List<ConnectionsTableData>> connectionsListProvider =
    StreamProvider<List<ConnectionsTableData>>((ref) {
  final ConnectionsDAO dao = ref.watch(connectionsDaoProvider);
  return dao.watchAllConnections();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO remove

    final AsyncValue<List<ConnectionsTableData>> connectionsAsync =
        ref.watch(connectionsListProvider);

    final connectionDao = ref.read(connectionsDaoProvider);

    final _animatedListKey = GlobalKey<AnimatedListState>();

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
          child: Text(
            "Check-In",
            style: Theme.of(context).textTheme.displayMedium,
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
                return const Center(child: Text("All Caught Up!"));
              }

              return Column(
                children: [
                  ...checkInConnections.map((connection) {
                    return TweenAnimationBuilder(
                        tween: Tween(begin: Offset(1, 0), end: Offset(0, 0)),
                        duration: Duration(milliseconds: 1000),
                        builder: (context, offset, child) {
                          return Transform.translate(
                            offset: offset * 20, // control slide distance
                            child: Opacity(
                              opacity: 1 - offset.dx, // fade in
                              child: child,
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: CheckinCard(
                            name: connection.connectionsName,
                            onTap: () {
                              context.push(
                                "/contact?id=${connection.connectionsId}",
                                extra: connection,
                              );
                            },
                            frequency: connection.contactFrequency,
                            image: connection.image,
                            onTapCheck: () {
                              connectionDao.updateCheckinByConnectionID(
                                  connection.connectionsId);
                            },
                          ),
                        ));
                  })
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
          child: Text(
            "Connections",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2),
          child: connectionsAsync.when(
            data: (List<ConnectionsTableData> connections) {
              if (connections.isEmpty) {
                return null;
              }
              return Column(
                  children: connections
                      .map((ConnectionsTableData connection) => ConnectionsCard(
                            name: connection.connectionsName,
                            frequency: connection.contactFrequency,
                            relation: connection.connectionsRelation,
                            image: connection.image,
                            score: connection.calculatedScore,
                            onTap: () {
                              context.push(
                                  "/contact?id=${connection.connectionsId}",
                                  extra: connection);
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
