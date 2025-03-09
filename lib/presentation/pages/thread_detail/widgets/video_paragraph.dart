import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoParagraph extends StatefulWidget {
  final String videoUrl;
  final bool isPlayable;
  const VideoParagraph({super.key, required this.videoUrl, this.isPlayable = true});

  @override
  State<VideoParagraph> createState() => _VideoParagraphState();
}

class _VideoParagraphState extends State<VideoParagraph> {
  late final player = Player();
  late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    player.open(Media(widget.videoUrl), play: false);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      color: Colors.black,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 9.0 / 16.0,
        child: Video(
          controller: controller,
          controls: widget.isPlayable ? AdaptiveVideoControls : NoVideoControls,
        ),
      ),
    );
  }
}
