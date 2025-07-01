import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/data/datasources/local/drift_database.dart";
import "package:propinquity/presentation/widgets/main_layout.dart";

class ConnectionsScreen extends ConsumerWidget {
  const ConnectionsScreen({super.key, required this.connectionsObj});
  final ConnectionsTableData connectionsObj;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return MainLayout(
      title: connectionsObj.connectionsName,
      body: Column(
        children: <Widget>[
          if (connectionsObj.image != null)
            Center(child: Image.memory(connectionsObj.image!))
        ],
      ),
    );
  }
}
