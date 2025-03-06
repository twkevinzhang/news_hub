import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/domain/thread/interactor/get_thread.dart';
import 'package:news_hub/presentation/pages/thread_detail/widgets/post_card.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/domain/models/models.dart' as domain;

class ThreadInfoCard extends StatelessWidget {
  final PostWithExtension thread;
  final FutureOr<void> Function(domain.Paragraph paragraph)? onParagraphClick;
  const ThreadInfoCard({
    super.key,
    required this.thread,
    this.onParagraphClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: () {
            AutoRouter.of(context).push(ThreadDetailRoute(
              extensionPkgName: thread.extensionPkgName,
              siteId: thread.siteId,
              boardId: thread.boardId,
              threadId: thread.id,
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: PostLayout(post: thread, onParagraphClick: onParagraphClick),
          )),
    );
  }
}
