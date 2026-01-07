import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/components/forms/collection/bloc/collection_form_cubit.dart';
import 'package:news_hub/presentation/components/forms/collection/view/collection_form.dart';

@RoutePage()
class CollectionEditScreen extends StatelessWidget implements AutoRouteWrapper {
  const CollectionEditScreen({super.key, required this.initialCollection});

  final Collection initialCollection;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CollectionFormCubit>()..init(initialCollection),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CollectionForm(initialCollection: initialCollection);
  }
}
