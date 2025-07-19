import "package:flutter/widgets.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/state/connections_form_controller.dart";

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ref.listen<String?>(formController.select((value) => value.connectionsName),
        (_, state) {
      relationsFieldStateController.text = state ?? '';
    });
    throw UnimplementedError();
  }
}
