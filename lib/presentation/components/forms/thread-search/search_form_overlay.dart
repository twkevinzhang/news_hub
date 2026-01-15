import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/components/forms/thread-search/bloc/search_form_cubit.dart';
import 'package:news_hub/presentation/components/inputs/app_search_bar.dart';
import 'package:news_hub/presentation/router/router.gr.dart';

class SearchFormOverlay extends StatelessWidget {
  final String collectionId;
  final ThreadsFilter initialFilter;
  final Function(ThreadsFilter) onSearch;
  final VoidCallback onClose;
  final String title;
  final bool shouldNavigateToResult;

  const SearchFormOverlay({
    super.key,
    required this.collectionId,
    required this.initialFilter,
    required this.onSearch,
    required this.onClose,
    required this.title,
    this.shouldNavigateToResult = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchFormCubit>()..init(initialFilter),
      child: _SearchFormScaffold(
        collectionId: collectionId,
        onSearch: onSearch,
        onClose: onClose,
        title: title,
        shouldNavigateToResult: shouldNavigateToResult,
      ),
    );
  }
}

class _SearchFormScaffold extends StatelessWidget {
  final String collectionId;
  final Function(ThreadsFilter) onSearch;
  final VoidCallback onClose;
  final String title;
  final bool shouldNavigateToResult;

  const _SearchFormScaffold({
    required this.collectionId,
    required this.onSearch,
    required this.onClose,
    required this.title,
    required this.shouldNavigateToResult,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchFormCubit>();

    void handleSearch(ThreadsFilter filter) {
      if (shouldNavigateToResult) {
        context.router.push(
          SearchResultRoute(collectionId: collectionId, filter: filter),
        );
        onClose();
      } else {
        onSearch(filter);
      }
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
      body: BlocBuilder<SearchFormCubit, SearchFormState>(
        builder: (context, state) {
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
                    handleSearch(state.filter);
                  },
                ),
              ),
              Expanded(
                child: state.suggestions.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  completed: (suggestions) {
                    if (suggestions.isEmpty) return const SizedBox.shrink();
                    return ListView(
                      children: [
                        ...suggestions.map(
                          (suggestion) => Column(
                            key: ValueKey(suggestion.id),
                            children: [
                              ListTile(
                                leading: const Icon(Icons.history, size: 20),
                                title: Text(suggestion.keywords),
                                trailing: IconButton(
                                  icon: const Icon(Icons.clear, size: 18),
                                  onPressed: () =>
                                      cubit.removeSuggestion(suggestion.id),
                                ),
                                onTap: () => cubit.clickSuggestion(suggestion),
                              ),
                              const Divider(
                                height: 1,
                                indent: 16,
                                endIndent: 16,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextButton(
                            onPressed: () => cubit.clearAllSuggestions(),
                            child: const Text('清除紀錄'),
                          ),
                        ),
                      ],
                    );
                  },
                  error: (e) => Center(child: Text(e.toString())),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
