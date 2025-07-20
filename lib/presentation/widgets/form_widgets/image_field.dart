import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:image_cropper/image_cropper.dart";
import "package:image_picker/image_picker.dart";
import "package:permission_handler/permission_handler.dart";
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
  @override
  void dispose() {
    super.dispose();
  }

  final ImagePicker _picker = ImagePicker();
  final SnackBar snackBar = const SnackBar(
      content: Text(
          "Permissions not granted, please enable permissions in settings"));

  final ImageCropper _imageCropper = ImageCropper();

  @override
  Widget build(BuildContext context) {
    final imageBytes = ref.watch(formController.select((value) => value.image));

    // TODO: implement build
    return GestureDetector(
      onLongPress: () {
        ref.read(formController.notifier).image = null;
      },
      onTap: () async {
        if ((await Permission.photos.status).isDenied) {
          await Permission.photos.request();
        }
        if ((await Permission.camera.status).isDenied) {
          await Permission.camera.request();
        }
        if ((await Permission.camera.status).isDenied ||
            (await Permission.photos.status).isDenied) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }
        final XFile? tmpImageFile =
            (await _picker.pickImage(source: ImageSource.gallery));
        if (tmpImageFile != null) {
          final CroppedFile? tmpCroppedImageFile =
              await _imageCropper.cropImage(
                  sourcePath: tmpImageFile.path,
                  maxWidth: 256,
                  maxHeight: 256,
                  compressQuality: 80,
                  aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1));
          if (tmpCroppedImageFile != null) {
            ref.read(formController.notifier).image =
                await tmpCroppedImageFile.readAsBytes();
          }
        }
      },
      child: Container(
        constraints: const BoxConstraints(
            minHeight: 128, minWidth: 128, maxWidth: 256, maxHeight: 256),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20)),
        child: imageBytes != null
            ? Center(
                child: Stack(children: <Widget>[
                Center(
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: Image.memory(imageBytes))),
                const Center(
                  child: Icon(Icons.camera_alt_outlined),
                )
              ]))
            : const Icon(Icons.camera_alt_outlined),
      ),
    );
  }
}
