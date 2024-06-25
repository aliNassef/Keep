import 'dart:typed_data';

import 'package:flutter/material.dart';

class NoteModel {
  final String title;
  final String subTitle;
  final Uint8List? image;

  const NoteModel({
    required this.title,
    required this.subTitle,
    @required this.image,
  });
}
