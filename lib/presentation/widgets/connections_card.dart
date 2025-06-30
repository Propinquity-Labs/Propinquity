import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ConnectionsCard extends ConsumerWidget {
  const ConnectionsCard(
      {super.key,
      required this.name,
      required this.frequency,
      required this.relation,
      required this.image,
      required this.score,
      required this.onTap});
  final String name;
  final String frequency;
  final String relation;
  final Uint8List? image;
  final int? score;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.secondary,
                  const Color.fromRGBO(243, 92, 110, 1.0)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Column(
                    children: [
                      image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.memory(
                                width: 60,
                                height: 60,
                                image!,
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                      ),
                      Text(
                        "Contacted $frequency",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                      Text(
                        relation,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary),
                      )
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Column(
                      children: [Text("")],
                    ))
              ],
            ),
          )),
    );
  }
}
