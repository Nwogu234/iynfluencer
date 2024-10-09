import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:iynfluencer/presentation/camera_view_screen/camera_view_screen.dart';
import 'package:iynfluencer/presentation/video_view_screen/video_view_scree.dart';

class DeliverableMedia extends StatelessWidget {
  final String mediaFile;

  const DeliverableMedia({required this.mediaFile});

  @override
  Widget build(BuildContext context) {
     String extension = Uri.parse(mediaFile).pathSegments.last.split('.').last.toLowerCase();

    if (extension == "jpg" || extension == "jpeg" || extension == "png") {
      return CameraViewScreen(deliver: mediaFile);
    } else if (extension == 'mp4') {
      return VideoViewScreen(deliver: mediaFile);
    } else if (extension == 'pdf' ||
        extension == 'doc' ||
        extension == 'docx' ||
        extension == 'ppt') {
      return PDFView(
        filePath: mediaFile,
      );
    } else if (extension == 'mp3') {
      // final audioPlayer = AudioPlayer();
      // audioPlayer.play(mediaFile.file.path, isLocal: true);
      return Text('Playing MP3: ${mediaFile}');
    } else {
      // Handle other or unsupported media types
      print('Unsupported media type: $mediaFile');
      return Text('Unsupported media type: ${mediaFile}');
    }
  }
}
