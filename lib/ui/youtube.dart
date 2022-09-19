import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeView extends StatefulWidget {
  final String videoId;

  const YoutubeView({required this.videoId, Key? key}) : super(key: key);

  @override
  State<YoutubeView> createState() => _YoutubeViewState();
}

class _YoutubeViewState extends State<YoutubeView> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    print('widget.videoId ${widget.videoId}');
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    )
      ..onInit = () {
        _controller.loadVideoById(videoId: widget.videoId);
      }
      ..onFullscreenChange = (isFullScreen) {};
    super.initState();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      aspectRatio: 16 / 9,
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(),
          body: player,
        );
      },
    );
  }
}
