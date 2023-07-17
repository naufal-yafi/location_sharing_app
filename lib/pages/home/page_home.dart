// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'component_ytVideo.dart';
import 'component_information.dart';
import '../../function/youtubeController.dart';

class VideoYoutube extends StatefulWidget {
  const VideoYoutube({super.key});
  @override
  _VideoYoutubeState createState() => _VideoYoutubeState();
}

class _VideoYoutubeState extends State<VideoYoutube> {
  static String videoID = 'u19PlnC0x2I';
  static String videoID2 = 'Gf2pPJSGtSU';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          youtubeVideo(context, ytController(videoID),
              "Bagaimana Menggunakan Aplikasi Ini?", "Video Tutorial", 35.0),
          youtubeVideo(context, ytController(videoID2),
              "Apa itu OpenStreetMap?", "Video Penjelasan", 10.0),
          information(context),
          const SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
