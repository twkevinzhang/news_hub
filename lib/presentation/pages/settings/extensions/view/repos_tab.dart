import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/presentation/pages/settings/extensions/bloc/repo_cubit.dart';
import 'package:news_hub/presentation/components/rendering/loading_indicator.dart';

class ReposTab extends StatelessWidget {
  const ReposTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RepoCubit>();
    return Scaffold(
      body: BlocBuilder<RepoCubit, RepoState>(
        buildWhen: (previous, current) => previous.repos != current.repos,
        builder: (context, state) {
          return state.repos.when(
            completed: (repos) => repos.isEmpty
                ? const Center(child: Text('No repositories added yet'))
                : ListView.builder(
                    itemCount: repos.length,
                    itemBuilder: (context, index) {
                      final repo = repos[index];
                      return ListTile(
                        leading: repo.icon != null
                            ? Image.network(repo.icon!, width: 40, height: 40)
                            : const Icon(Icons.source),
                        title: Text(repo.displayName),
                        subtitle: Text(repo.baseUrl),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () =>
                              _confirmDelete(context, cubit, repo.baseUrl),
                        ),
                      );
                    },
                  ),
            error: (e) => Center(child: Text(e.toString())),
            initial: () => const SizedBox(),
            loading: () => const LoadingIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddRepoDialog(context, cubit),
      ),
    );
  }

  void _confirmDelete(BuildContext context, RepoCubit cubit, String baseUrl) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Repository'),
        content: const Text('Are you sure you want to remove this repository?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              cubit.removeRepo(baseUrl);
              Navigator.pop(context);
            },
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }

  void _showAddRepoDialog(BuildContext context, RepoCubit cubit) {
    final urlController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Repository'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: urlController,
              decoration: const InputDecoration(
                labelText: 'GitHub Repository URL',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              cubit.addRepo(url: urlController.text);
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
