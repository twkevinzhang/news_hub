import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart' as kit;
import 'package:media_kit_video/media_kit_video.dart' as kit_video;
import 'package:news_hub/presentation/pages/thread_detail/widgets/video_controls.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoParagraph extends StatefulWidget {
  final String videoUrl;
  final bool isPlayable;
  const VideoParagraph({super.key, required this.videoUrl, this.isPlayable = true});

  @override
  State<VideoParagraph> createState() => _VideoParagraphState();
}

class _VideoParagraphState extends State<VideoParagraph> {
  late final player = kit.Player();
  late final controller = kit_video.VideoController(player);

  @override
  void initState() {
    super.initState();
    player.open(kit.Media(widget.videoUrl), play: false);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppVideoControlsTheme(
      normal: AppVideoControlsThemeData(
        visibleOnMount: true,
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
      fullscreen: const AppVideoControlsThemeData(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 9.0 / 16.0,
        child: kit_video.Video(
          controller: controller,
          controls: widget.isPlayable ? AppVideoControls : kit_video.NoVideoControls,
        ),
      ),
    );
  }
}
