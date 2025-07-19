import "package:flutter/material.dart";

class ModifyConnectionButton extends StatelessWidget {
  const ModifyConnectionButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      onPressed: onTap,
      tooltip: "Edit this connection",
      child: const Icon(Icons.edit),
    );
  }
}
