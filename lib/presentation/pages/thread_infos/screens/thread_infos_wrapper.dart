import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/thread_infos/bloc/filter_by_boards_cubit.dart';
import 'package:news_hub/presentation/pages/thread_infos/bloc/thread_infos_cubit.dart';

@RoutePage()
class ThreadsInfosWrapper extends StatelessWidget implements AutoRouteWrapper {
  const ThreadsInfosWrapper({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThreadInfosCubit>(
          create: (context) => sl<ThreadInfosCubit>()..init(),
        ),
        BlocProvider(
          create: (context) => sl<FilterByBoardsCubit>()..init(),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
