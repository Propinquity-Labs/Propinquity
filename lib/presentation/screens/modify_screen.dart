import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/data/datasources/local/drift_database.dart";
import "package:propinquity/presentation/widgets/form_widgets/frequency_field.dart";
import "package:propinquity/presentation/widgets/form_widgets/name_field.dart";
import "package:propinquity/presentation/widgets/main_layout.dart";

class ModifyScreen extends ConsumerStatefulWidget {
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
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ModifyScreenState();
  }
}

class _ModifyScreenState extends ConsumerState<ModifyScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MainLayout(
      title: "${widget.modification ? "Modify" : "Add"} a Connection",
      body: <Widget>[
        Form(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.zero,
              child:
                  Text("Name", style: Theme.of(context).textTheme.displaySmall),
            ),
            // Name field
            const NameField(),
            Padding(
              padding: EdgeInsets.zero,
              child: Text("Roughly how frequently do you want to communicate?",
                  style: Theme.of(context).textTheme.displaySmall),
            ),
            const FrequencyField(),
            // Roughly how frequently do you want to communicate?
            Padding(
              padding: EdgeInsets.zero,
              child: Text(
                  "Roughly, what would you say your relationship status is",
                  style: Theme.of(context).textTheme.displaySmall),
            ),
            // Any important dates you don’t want to miss?
            Padding(
              padding: EdgeInsets.zero,
              child: Text("Any important dates you don’t want to miss?",
                  style: Theme.of(context).textTheme.displaySmall),
            )
          ],
        )),
        // Anything else you’d like to keep note of? (Email’s, Phone #’s, Allergies, etc)
      ],
    );
  }
}
