import "dart:io";
import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter_image_compress/flutter_image_compress.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:image_cropper/image_cropper.dart";
import "package:image_picker/image_picker.dart";
import "package:path_provider/path_provider.dart";
import "package:permission_handler/permission_handler.dart";
import "package:propinquity/application/state/connections_form_controller.dart";
import "package:propinquity/data/models/connections_form_model.dart";

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

  final ImageCropper _imageCropper = ImageCropper();
  final ImagePicker _picker = ImagePicker();
  final SnackBar errorSnackBar = const SnackBar(
      content: Text(
          "Permissions not granted, please enable permissions in settings"));
  final SnackBar successSnackBar = const SnackBar(
      content: Text(
          "Permissions not granted, please enable permissions in settings"));

  Future<XFile?> fixImageOrientation(XFile file) async {
    final Directory dir = await getTemporaryDirectory();
    final String targetPath = "${dir.absolute.path}/temp_fixed.jpg";

    final XFile? result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      targetPath,
      quality: 100,
      rotate: 0,
    );

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final Uint8List? imageBytes = ref.watch(
        formController.select((ConnectionsFormModel value) => value.image));

    final List<PlatformUiSettings> cropperSettings = <PlatformUiSettings>[
      AndroidUiSettings(
        toolbarTitle: "Crop your image",
        backgroundColor: Theme.of(context).colorScheme.surface,
        cropFrameColor: Theme.of(context).colorScheme.primary,
        toolbarWidgetColor: Theme.of(context).colorScheme.onSurface,
        activeControlsWidgetColor: Theme.of(context).colorScheme.primary,
        cropGridColor: Theme.of(context).colorScheme.surface,
        toolbarColor: Theme.of(context).colorScheme.surface,
        statusBarColor: Theme.of(context).colorScheme.surface,
        hideBottomControls: true,
        lockAspectRatio: true,
      ),
      IOSUiSettings(
          title: "Crop your image",
          aspectRatioLockEnabled: true,
          aspectRatioPickerButtonHidden: true,
          aspectRatioPresets: [CropAspectRatioPreset.square])
    ];

    // TODO: implement build
    return GestureDetector(
      onLongPress: () {
        ref.read(formController.notifier).image = null;
      },
      onTap: () async {
        // Get permissions if not already granted
        if ((await Permission.photos.status).isDenied) {
          await Permission.photos.request();
        }
        if ((await Permission.camera.status).isDenied) {
          await Permission.camera.request();
        }
        // If permissions not granted show error
        if ((await Permission.camera.status).isDenied ||
            (await Permission.photos.status).isDenied) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
          }
        } else {
          // Otherwise open image picker
          final XFile? tmpImageFile =
              (await _picker.pickImage(source: ImageSource.gallery));

          // If image picked, use compression library to fix orientation
          if (tmpImageFile != null) {
            final XFile? tmpFixedFile = await fixImageOrientation(tmpImageFile);
            // If the fixed file is not null, open cropper
            if (tmpFixedFile != null && mounted) {
              final CroppedFile? tmpCroppedImageFile =
                  await _imageCropper.cropImage(
                      uiSettings: cropperSettings,
                      sourcePath: tmpFixedFile.path,
                      maxWidth: 256,
                      maxHeight: 256,
                      compressQuality: 100,
                      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1));
              // If cropping image is successful, set the image to the cropped image
              // and update controller
              if (tmpCroppedImageFile != null) {
                ref.read(formController.notifier).image =
                    await tmpCroppedImageFile.readAsBytes();
              }
            }
          }
        }
      },
      child: Container(
        constraints: const BoxConstraints(
            minHeight: 196, minWidth: 196, maxWidth: 196, maxHeight: 196),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(30)),
        child: imageBytes != null
            ? Center(
                child: Stack(children: <Widget>[
                Center(
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: Image.memory(imageBytes))),
                Center(
                  child: Icon(
                    Icons.camera_alt_outlined,
                    weight: 10,
                    color: Theme.of(context).colorScheme.surface.withAlpha(180),
                    size: 128,
                  ),
                )
              ]))
            : Icon(Icons.camera_alt_outlined,
                size: 128,
                color: Theme.of(context).colorScheme.surface.withAlpha(180)),
      ),
    );
  }
}
