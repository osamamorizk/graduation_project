import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const YouTubeVideoPlayer({super.key, required this.videoUrl});

  @override
  YouTubeVideoPlayerState createState() => YouTubeVideoPlayerState();
}

class YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);

    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: const YoutubePlayerFlags(
        loop: true,
        autoPlay: true,
        mute: false,
        enableCaption: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      onEnded: (metaData) {
        _controller.seekTo(const Duration(seconds: 0));
        _controller.play();
      },
      bottomActions: const <Widget>[
        SizedBox(width: 14.0),
        CurrentPosition(),
        SizedBox(width: 8.0),
        ProgressBar(isExpanded: true),
        RemainingDuration(),
      ],
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
    );
  }
}
