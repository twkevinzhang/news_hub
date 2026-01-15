import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/presentation/components/rendering/loading_indicator.dart';
import 'video_paragraph.dart';

class PostGalleryOverlay extends StatelessWidget {
  const PostGalleryOverlay({
    super.key,
    required this.title,
    required this.post,
  });
  final String title;
  final domain.Post post;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    final ThemeData theme = Theme.of(context);
    final textStyle =
        theme.appBarTheme.titleTextStyle ??
        theme.textTheme.headlineSmall?.copyWith(
          color: theme.primaryTextTheme.headlineSmall?.color,
        );

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.close_outlined),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ), // AppBar 默认 padding
                child: Text(title, style: textStyle),
              ),
              IconButton(
                icon: const Icon(Icons.download_outlined),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GalleryItem extends StatelessWidget {
  final domain.Paragraph media;
  const GalleryItem({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    switch (media) {
      case final domain.ImageParagraph image:
        return CachedNetworkImage(
          imageUrl: image.raw,
          placeholder: (context, url) => const LoadingIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      case final domain.VideoParagraph video:
        return Center(
          child: FittedBox(
            fit: BoxFit.contain, // ✅ 確保比例不變，且寬度最寬
            child: VideoParagraph(videoUrl: video.url),
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
