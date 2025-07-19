import "package:flutter/widgets.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/state/connections_form_controller.dart";

class DateField extends ConsumerStatefulWidget {
  const DateField({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _DateFieldState();
  }
}

class _DateFieldState extends ConsumerState {
  final dateFieldStateController = TextEditingController();

  @override
  void dispose() {
    dateFieldStateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ref.listen<String?>(formController.select((value) => value.connectionsName),
        (_, state) {
      dateFieldStateController.text = state ?? '';
    });
    throw UnimplementedError();
  }
}
