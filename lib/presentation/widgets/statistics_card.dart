import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class StatisticsCard extends ConsumerWidget {
  const StatisticsCard({super.key, this.calculatedScore = 20});

  final int? calculatedScore;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: const <Color>[
            Color.fromRGBO(54, 189, 106, 1),
            Color.fromRGBO(126, 126, 126, 1)
          ], stops: <double>[
            calculatedScore != null ? calculatedScore! / 100 : 0,
            calculatedScore != null ? (calculatedScore! / 100) + 0.05 : 0
          ])),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            "Propinquity Rating",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          Text(
            "${calculatedScore ?? 0}/100",
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
          )
        ],
      ),
    );
  }
}
