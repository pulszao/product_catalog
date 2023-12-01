import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage(ImageSource imageSource) async {
  try {
    final _image = await ImagePicker().pickImage(source: imageSource);
    if (_image == null) {
      return null;
    } else {
      final _cropped = await ImageCropper().cropImage(
        sourcePath: _image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Foto de perfil',
          ),
          IOSUiSettings(
            title: 'Foto de perfil',
            doneButtonTitle: 'OK',
            cancelButtonTitle: 'Cancelar',
          ),
        ],
      );

      final imageTemp = File(_cropped!.path);

      return imageTemp;
    }
  } on PlatformException catch (_) {
    return null;
  }
}
