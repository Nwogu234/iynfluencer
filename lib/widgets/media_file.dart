import 'package:flutter/material.dart';
import 'package:iynfluencer/data/models/media_file/media_file.dart';
import 'package:iynfluencer/presentation/camera_screen/camera_scree.dart';
import 'package:iynfluencer/presentation/camera_view_screen/camera_view_screen.dart';
import 'package:iynfluencer/presentation/video_view_screen/video_view_scree.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart'; // For PDF document viewing
import 'package:audioplayers/audioplayers.dart';

class MediaFileWidget extends StatelessWidget {
  final MediaFile mediaFile;


  MediaFileWidget({
   required this.mediaFile});

  @override
  Widget build(BuildContext context) {
    if (mediaFile.type == '.jpg' ||
        mediaFile.type == ".jpeg" ||
        mediaFile.type == ".png") {
      return CameraViewScreen(mediaFile: mediaFile.file);
    } else if (mediaFile.type == 'mp4') {
      return VideoViewScreen(mediaFile: mediaFile.file);
    } else if (mediaFile.type == 'pdf' ||
        mediaFile.type == 'doc' ||
        mediaFile.type == 'docx' ||
        mediaFile.type == 'ppt') {
      return PDFView(
        filePath: mediaFile.file.path,
      );
    } else if (mediaFile.type == 'mp3') {
      // final audioPlayer = AudioPlayer();
      // audioPlayer.play(mediaFile.file.path, isLocal: true);
      return Text('Playing MP3: ${mediaFile.file.path}');
    } else {
      // Handle other or unsupported media types
      return Text('Unsupported media type: ${mediaFile.type}');
    }
  }
}
