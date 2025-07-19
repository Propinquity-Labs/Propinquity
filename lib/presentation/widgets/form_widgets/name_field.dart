import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/state/connections_form_controller.dart";

class NameField extends ConsumerStatefulWidget {
  const NameField({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _NameFieldState();
  }
}

class _NameFieldState extends ConsumerState {
  final _nameFieldStateController = TextEditingController();

  @override
  void dispose() {
    _nameFieldStateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ref.listen<String?>(formController.select((value) => value.connectionsName),
        (_, state) {
      _nameFieldStateController.text = state ?? "";
    });
    return TextFormField(
      maxLines: 1,
      decoration: const InputDecoration(hintText: "Type name here"),
      controller: _nameFieldStateController,
      onChanged: (String value) =>
          ref.read(formController.notifier).connectionsName = value,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "A connection needs a name";
        }
        return null;
      },
    );
  }
}
