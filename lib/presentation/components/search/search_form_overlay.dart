import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/components/inputs/app_search_bar.dart';
import 'package:news_hub/presentation/pages/collection/:collectionId/threads/search/bloc/search_cubit.dart';
import 'package:news_hub/presentation/router/router.gr.dart';

class SearchFormOverlay extends StatelessWidget {
  final String collectionId;
  final ThreadsFilter initialFilter;
  final Function(ThreadsFilter) onSearch;
  final VoidCallback onClose;
  final String title;

  const SearchFormOverlay({
    super.key,
    required this.collectionId,
    required this.initialFilter,
    required this.onSearch,
    required this.onClose,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchCubit>()..init(initialFilter),
      child: _SearchFormScaffold(
        collectionId: collectionId,
        onSearch: onSearch,
        onClose: onClose,
        title: title,
      ),
    );
  }
}

class _SearchFormScaffold extends StatelessWidget {
  final String collectionId;
  final Function(ThreadsFilter) onSearch;
  final VoidCallback onClose;
  final String title;

  const _SearchFormScaffold({
    required this.collectionId,
    required this.onSearch,
    required this.onClose,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();

    void navigateToResult(ThreadsFilter filter) {
      context.router.push(
        SearchResultRoute(collectionId: collectionId, filter: filter),
      );
      onClose();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        leading: IconButton(icon: const Icon(Icons.close), onPressed: onClose),
        title: Text(title),
        actions: [
          TextButton(onPressed: () => cubit.reset(), child: const Text('重設')),
        ],
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          final suggestions = state.resultFilteredSuggestions;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AppSearchBar(
                  value: state.filter.keywords,
                  autoFocus: true,
                  onChanged: (val) => cubit.setKeywords(val),
                  onClear: () => cubit.clearKeywords(),
                  onSearch: () {
                    cubit.submit();
                    navigateToResult(cubit.state.filter);
                  },
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: suggestions.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1, indent: 16, endIndent: 16),
                  itemBuilder: (context, index) {
                    final suggestion = suggestions[index];
                    return ListTile(
                      leading: const Icon(Icons.history, size: 20),
                      title: Text(suggestion.keywords),
                      onTap: () {
                        cubit.clickSuggestion(suggestion);
                        cubit.submit();
                        navigateToResult(cubit.state.filter);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
