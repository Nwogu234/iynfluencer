import 'package:flutter/material.dart';
import 'package:iynfluencer/data/models/media_file/media_file.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart'; // For PDF document viewing
import 'package:audioplayers/audioplayers.dart';

class MediaFileWidget extends StatelessWidget {
  final MediaFile mediaFile;

  MediaFileWidget({required this.mediaFile});

  @override
  Widget build(BuildContext context) {
    if (mediaFile.type == 'image') {
      // Display the image
      return Image.file(mediaFile.file);
    } else if (mediaFile.type == 'video') {
      // Display the video using the video_player package
      final videoPlayerController = VideoPlayerController.file(mediaFile.file);
      return VideoPlayer(videoPlayerController);
    } else if (mediaFile.type == 'document') {
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
