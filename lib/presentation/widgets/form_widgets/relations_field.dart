import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/state/connections_form_controller.dart";
import "package:propinquity/data/models/connections_form_model.dart";

class RelationsField extends ConsumerStatefulWidget {
  const RelationsField({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _RelationsFieldState();
  }
}

class _RelationsFieldState extends ConsumerState {
  final relationsFieldStateController = TextEditingController();

  @override
  void dispose() {
    relationsFieldStateController.dispose();
    super.dispose();
  }

  final List<String> dropDownItems = <String>[
    "Acquaintances",
    "Companions",
    "Friends",
    "Great Friends",
    "Best Friends",
    "Partners"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ref.listen<String?>(
        formController
            .select((ConnectionsFormModel value) => value.connectionsName),
        (_, String? state) {
      relationsFieldStateController.text = state ?? "";
    });
    return DropdownButtonFormField<String>(
      dropdownColor: Theme.of(context).colorScheme.surface.withAlpha(220),
      onChanged: (dynamic value) =>
          ref.watch(formController.notifier).connectionsRelation = value,
      items: dropDownItems.map((String freq) {
        return DropdownMenuItem<String>(
          value: freq,
          child: Text(freq, style: Theme.of(context).textTheme.bodyMedium),
        );
      }).toList(),
    );
  }
}
