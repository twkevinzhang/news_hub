import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/get_thread.dart' show PostWithExtension;
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/search/bloc/search_cubit.dart';
import 'package:news_hub/presentation/pages/thread_infos/widgets/thread_card.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

@RoutePage()
class ThreadInfosWrapper extends StatelessWidget implements AutoRouteWrapper {
  const ThreadInfosWrapper({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchCubit>()..init(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}
