import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_hub/domain/models/models.dart' as domain;

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
    final textStyle = theme.appBarTheme.titleTextStyle ??
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // AppBar 默认 padding
              child: Text(
                title,
                style: textStyle,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.download_outlined),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ],
    ));
  }
}
