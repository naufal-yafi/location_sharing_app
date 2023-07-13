import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'component_ytVideo.dart';
import 'component_information.dart';

class VideoYoutube extends StatefulWidget {
  const VideoYoutube({super.key});
  _VideoYoutubeState createState() => _VideoYoutubeState();
}

class _VideoYoutubeState extends State<VideoYoutube> {
  static String videoID = 'u19PlnC0x2I';
  static String videoID2 = 'Gf2pPJSGtSU';

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videoID,
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  YoutubePlayerController _controller2 = YoutubePlayerController(
    initialVideoId: videoID2,
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          youtubeVideo(context, _controller,
              "Bagaimana Menggunakan Aplikasi Ini?", "Video Tutorial", 35),
          youtubeVideo(context, _controller2, "Apa itu OpenStreetMap?",
              "Video Penjelasan", 10),
          information(context),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
