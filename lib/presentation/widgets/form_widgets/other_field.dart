import "package:flutter/widgets.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/state/connections_form_controller.dart";

class OtherField extends ConsumerStatefulWidget {
  const OtherField({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _OtherFieldState();
  }
}

class _OtherFieldState extends ConsumerState {
  final otherFieldStateController = TextEditingController();

  @override
  void dispose() {
    otherFieldStateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ref.listen<String?>(formController.select((value) => value.connectionsName),
        (_, state) {
      otherFieldStateController.text = state ?? '';
    });
    throw UnimplementedError();
  }
}
