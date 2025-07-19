import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/data/datasources/local/drift_database.dart";
import "package:propinquity/presentation/widgets/main_layout.dart";

class ModifyScreen extends ConsumerWidget {
  const ModifyScreen(
      {super.key,
      this.image,
      this.name,
      this.frequency,
      this.fields,
      this.modification = false});

  final Uint8List? image;
  final String? name;
  final String? frequency;
  final List<ConnectionsFieldsTableData>? fields;
  final bool modification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return MainLayout(
      title: "${modification ? "Modify" : "Add"} a Connection",
      body: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            child: Container(
              constraints: const BoxConstraints(
                  maxHeight: 256, maxWidth: 256, minWidth: 128, minHeight: 128),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.memory(image!),
                    )
                  : const Icon(Icons.camera_alt_rounded),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: Text("Name", style: Theme.of(context).textTheme.displaySmall),
        ),
        // Name field
        Padding(
          padding: EdgeInsets.zero,
          child: Text("Roughly how frequently do you want to communicate?",
              style: Theme.of(context).textTheme.displaySmall),
        ),
        // Roughly how frequently do you want to communicate?
        Padding(
          padding: EdgeInsets.zero,
          child: Text("Any important dates you don’t want to miss?",
              style: Theme.of(context).textTheme.displaySmall),
        ),
        // Any important dates you don’t want to miss?
        Padding(
          padding: EdgeInsets.zero,
          child: Text("Any important dates you don’t want to miss?",
              style: Theme.of(context).textTheme.displaySmall),
        ),
        // Anything else you’d like to keep note of? (Email’s, Phone #’s, Allergies, etc)
      ],
    );
  }
}
