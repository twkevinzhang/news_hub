import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/components/forms/collection/bloc/collection_form_cubit.dart';
import 'package:news_hub/presentation/components/forms/collection/view/collection_form.dart';

@RoutePage()
class CollectionCreateScreen extends StatelessWidget implements AutoRouteWrapper {
  const CollectionCreateScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CollectionFormCubit>()..init(null),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const CollectionForm();
  }
}
