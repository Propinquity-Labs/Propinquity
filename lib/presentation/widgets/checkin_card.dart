import "dart:typed_data";

import "package:flutter/material.dart";

class CheckinCard extends StatefulWidget {
  const CheckinCard(
      {super.key,
      required this.name,
      this.onTap,
      required this.image,
      required this.onTapCheck});

  final void Function()? onTap;
  final String name;
  final Uint8List? image;
  final void Function()? onTapCheck;

  @override
  State<CheckinCard> createState() => _CheckinCardState();
}

class _CheckinCardState extends State<CheckinCard> {
  bool canCheck = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!canCheck) {
            setState(() {
              canCheck = true;
            });
          }
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.secondary,
                const Color.fromRGBO(243, 92, 213, 1.0)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                widget.image != null && !canCheck
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.memory(
                          width: 60,
                          height: 60,
                          widget.image!,
                        ),
                      )
                    : SizedBox(
                        height: 60,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                  onPressed: widget.onTapCheck,
                                  icon: const Icon(Icons.check_rounded)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      canCheck = false;
                                    });
                                  },
                                  icon: const Icon(Icons.cancel_rounded))
                            ])),
                Text(widget.name,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                    softWrap: true,
                    overflow: TextOverflow.visible, // or TextOverflow.ellipsis
                    maxLines: null)
              ],
            ),
          ),
        ));
  }
}
