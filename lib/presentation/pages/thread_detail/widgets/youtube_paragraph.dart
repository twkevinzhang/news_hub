import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeParagraph extends StatefulWidget {
  final String clipId;
  const YouTubeParagraph({
    super.key,
    required this.clipId,
  });

  @override
  State<YouTubeParagraph> createState() => _YouTubeParagraphState();
}

class _YouTubeParagraphState extends State<YouTubeParagraph> {
  late YoutubePlayerController _controller;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.clipId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    )..addListener(_listener);
    super.initState();
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      onReady: () {
        setState(() {
          _isPlayerReady = true;
        });
        debugPrint('Player is ready.');
      },
      bottomActions: [
        CurrentPosition(),
        ProgressBar(isExpanded: true),
        RemainingDuration(),
        IconButton(
          onPressed: () async {
            _controller.pause();
            final seconds = _controller.value.position.inSeconds;
            final url = "https://www.youtube.com/watch?v=${widget.clipId}&t=$seconds";
            if (!await launchUrl(Uri.parse(url))) {
              debugPrint('Could not launch $url');
            }
          },
          icon: Icon(Icons.open_in_new_outlined, color: Colors.white),
        ),
      ],
    );
  }
}
