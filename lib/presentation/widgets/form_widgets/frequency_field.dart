import "package:flutter/widgets.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/state/connections_form_controller.dart";

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ref.listen<String?>(formController.select((value) => value.connectionsName),
        (_, state) {
      frequencyFieldStateController.text = state ?? '';
    });
    throw UnimplementedError();
  }
}
