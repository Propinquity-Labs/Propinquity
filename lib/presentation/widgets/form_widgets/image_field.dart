import "package:flutter/widgets.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:propinquity/application/state/connections_form_controller.dart";

class ImageField extends ConsumerStatefulWidget {
  const ImageField({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _ImageFieldState();
  }
}

class _ImageFieldState extends ConsumerState {
  final imageFieldStateController = TextEditingController();

  @override
  void dispose() {
    imageFieldStateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ref.listen<String?>(formController.select((value) => value.connectionsName),
        (_, state) {
      imageFieldStateController.text = state ?? '';
    });
    throw UnimplementedError();
  }
}
