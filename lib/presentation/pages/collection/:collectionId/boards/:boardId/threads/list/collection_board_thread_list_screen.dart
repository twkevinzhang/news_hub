import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/components/lists/thread/bloc/thread_list_cubit.dart';
import 'package:news_hub/presentation/components/lists/thread/view/thread_list.dart';

@RoutePage()
class CollectionBoardThreadListScreen extends StatelessWidget implements AutoRouteWrapper {
  const CollectionBoardThreadListScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThreadListCubit>()..init(null, null),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThreadList();
  }
}
