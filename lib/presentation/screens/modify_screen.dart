import "package:flutter/widgets.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/presentation/widgets/main_layout.dart";

class ModifyScreen extends ConsumerWidget {
  const ModifyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return const MainLayout(
      title: "Add a Connection",
      body: <Widget>[Text("Test")],
    );
  }
}
