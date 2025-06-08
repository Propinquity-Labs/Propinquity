import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/presentation/widgets/main_layout.dart";

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return MainLayout(
        title: "Hi, how's it going!",
        body: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Now’s a great time to reconnect with a  friend you’ve not talked to in a while! If you don’t know where to start, read more about some suggestions here!",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
          const Row(
            children: <Widget>[
              Column(
                children: <Widget>[Text("Row")],
              )
            ],
          )
        ]));
  }
}
