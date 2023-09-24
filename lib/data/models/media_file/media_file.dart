import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaFile {
  final String name;
  final String type;
  final File file;

  MediaFile({required this.name, required this.type, required this.file});
}
