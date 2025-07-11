import "dart:typed_data";

import "package:flutter/material.dart";

class CheckinCard extends StatefulWidget {
  const CheckinCard(
      {super.key,
      required this.name,
      this.onTap,
      this.frequency = "Jee",
      required this.image,
      required this.onTapCheck});

  final void Function()? onTap;
  final String name;
  final Uint8List? image;
  final void Function()? onTapCheck;
  final String frequency;

  @override
  State<CheckinCard> createState() => _CheckinCardState();
}

class _CheckinCardState extends State<CheckinCard> {
  bool canCheck = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.secondary,
                const Color.fromRGBO(243, 92, 213, 1.0)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
            child: Row(
              children: <Widget>[
                widget.image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.memory(
                          width: 60,
                          height: 60,
                          widget.image!,
                        ),
                      )
                    : const SizedBox(height: 60),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                      child: Column(
                        children: <Widget>[
                          Text(widget.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                              softWrap: true,
                              overflow: TextOverflow
                                  .visible, // or TextOverflow.ellipsis
                              maxLines: null),
                          Text(widget.frequency,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                              softWrap: true,
                              overflow: TextOverflow
                                  .visible, // or TextOverflow.ellipsis
                              maxLines: null)
                        ],
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                    child: IconButton(
                        tooltip:
                            "Tap to mark that you've checked in with ${widget.name}",
                        onPressed: widget.onTapCheck,
                        color: Colors.white,
                        style: IconButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            padding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        icon: const Icon(
                          Icons.check_box_rounded,
                          color: Color.fromRGBO(54, 189, 106, 1),
                          size: 60,
                        )))
              ],
            ),
          ),
        ));
  }
}
