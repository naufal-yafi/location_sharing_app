// ignore_for_file: file_names

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

YoutubePlayerController ytController(videoID) => YoutubePlayerController(
      initialVideoId: videoID,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
