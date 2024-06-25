import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<dynamic> pickImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    final bytes = await image.readAsBytes();
    return bytes;
  } else {
    debugPrint('FALSE FALSE FALSE FALSE FALSE');
  }
}