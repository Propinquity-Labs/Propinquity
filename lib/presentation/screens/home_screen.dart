import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/presentation/widgets/connections_card.dart";
import "package:propinquity/presentation/widgets/main_layout.dart";

final testImageProvider = FutureProvider<Uint8List>((ref) async {
  final data =
      await rootBundle.load("lib/assets/test_images/test_1_shrimp.png");
  return data.buffer.asUint8List();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO remove
    final testImageAsync = ref.watch(testImageProvider);

    // TODO: implement build
    return MainLayout(
        title: "Hi, how's it going!",
        body: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Now’s a great time to reconnect with a  friend you’ve not talked to in a while! If you don’t know where to start, read more about some suggestions here!",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              testImageAsync.when(
                  data: (Uint8List image) => ConnectionsCard(
                        name: "Harry Ron Franks",
                        frequency: "Weekly",
                        relation: "Acquaintance",
                        image: image,
                        score: null,
                      ),
                  error: (err, stack) => Text("Error loading image: $err"),
                  loading: () => const CircularProgressIndicator())
            ],
          )
        ]));
  }
}
