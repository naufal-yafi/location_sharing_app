// ignore_for_file: file_names

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

Column youtubeVideo(BuildContext context, YoutubePlayerController controller,
    title, label, marginTop) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: marginTop),
          child: Text("$title",
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          height: 9,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(Icons.movie, size: 18, color: Colors.blue.shade600),
              const SizedBox(
                width: 10,
              ),
              Text(
                "$label",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue.shade600),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: YoutubePlayer(
            controller: controller,
            liveUIColor: Colors.white,
            showVideoProgressIndicator: true,
          ),
        )
      ]);
}
