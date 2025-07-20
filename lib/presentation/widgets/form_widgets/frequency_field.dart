import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/state/connections_form_controller.dart";
import "package:propinquity/data/models/connections_form_model.dart";

class FrequencyField extends ConsumerStatefulWidget {
  const FrequencyField({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _FrequencyFieldState();
  }
}

class _FrequencyFieldState extends ConsumerState {
  final frequencyFieldStateController = TextEditingController();

  @override
  void dispose() {
    frequencyFieldStateController.dispose();
    super.dispose();
  }

  List<String> dropDownItems = [
    "Daily",
    "Every other day",
    "Bi-weekly",
    "Weekends",
    "Bi-monthly",
    "Monthly"
  ];

  @override
  Widget build(BuildContext context) {
    ref.listen<String?>(
        formController
            .select((ConnectionsFormModel value) => value.contactFrequency),
        (_, state) {
      frequencyFieldStateController.text = state ?? "";
    });
    return DropdownButtonFormField<String>(
      dropdownColor: Theme.of(context).colorScheme.surface.withAlpha(220),
      onChanged: (dynamic value) =>
          ref.watch(formController.notifier).connectionsFrequency = value,
      items: dropDownItems.map((String freq) {
        return DropdownMenuItem<String>(
          value: freq,
          child: Text(freq, style: Theme.of(context).textTheme.bodyMedium),
        );
      }).toList(),
    );
  }
}
