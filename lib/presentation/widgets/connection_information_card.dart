import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ConnectionInformationCard extends ConsumerWidget {
  const ConnectionInformationCard(
      {super.key,
      required this.bodyString,
      required this.headerString,
      this.width});
  final String headerString;
  final String bodyString;
  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          gradient: LinearGradient(colors: <Color>[
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondary
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 6, 4, 6),
            child: Text(
              headerString,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 0, 4, 6),
            child: Text(bodyString,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary)),
          )
        ],
      ),
    );
  }
}
