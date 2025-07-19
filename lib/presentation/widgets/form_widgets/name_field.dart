import "package:flutter/widgets.dart";
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
  final nameFieldStateController = TextEditingController();

  @override
  void dispose() {
    nameFieldStateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ref.listen<String?>(formController.select((value) => value.connectionsName),
        (_, state) {
      nameFieldStateController.text = state ?? '';
    });
    throw UnimplementedError();
  }
}
