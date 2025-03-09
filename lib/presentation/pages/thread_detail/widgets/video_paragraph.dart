import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return MaterialVideoControlsTheme(
      normal: MaterialVideoControlsThemeData(
        bottomButtonBar: [
          MaterialPositionIndicator(),
          Spacer(),
          IconButton(
            onPressed: () async {
              controller.player.pause();
              if (!await launchUrl(Uri.parse(widget.videoUrl))) {
                debugPrint('Could not launch ${widget.videoUrl}');
              }
            },
            icon: Icon(Icons.open_in_new_outlined, color: Colors.white),
          ),
        ],
        padding: EdgeInsets.only(bottom: 16.0),
      ),
      fullscreen: const MaterialVideoControlsThemeData(
        automaticallyImplySkipNextButton: false,
        automaticallyImplySkipPreviousButton: false,
      ),
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
