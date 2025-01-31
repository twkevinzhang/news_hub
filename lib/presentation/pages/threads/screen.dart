part of 'index.dart';

@RoutePage()
class ThreadsScreen extends StatelessWidget {
  ThreadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThreadsCubit>(),
      child: _ThreadsView(),
    );
  }
}

class _ThreadsView extends StatelessWidget {
  _ThreadsView({super.key});

  final router = sl<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThreadsCubit, ThreadsState>(
        builder: (context, state) {
          final cubit = context.read<ThreadsCubit>();

          return Scaffold(
              appBar: AppBar(
                title: const Text('Threads'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search_outlined),
                    onPressed: () async {
                      final result = await router.push<SearchConfigForm?>(SearchRoute());
                      if (!context.mounted) return;
                      if (result != null) {
                        cubit.searchConfigForm = result;
                        cubit.pagingController.refresh();
                      }
                    },
                  ),
                ],
              ),
            body: PagedListView<int, ThreadWithExtension>(
              pagingController: cubit.pagingController,
              builderDelegate: PagedChildBuilderDelegate<ThreadWithExtension>(
                itemBuilder: (context, thread, index) => GestureDetector(
                  onTap: () {

                  },
                  child: Column(
                    children: [
                      PostCard(post: thread.masterPost, boardName: "[${thread.extension.displayName}] ${thread.boardName}"),
                      const Divider(),
                    ],
                  ),
                ),
                noItemsFoundIndicatorBuilder: (context) => Center(
                  child: Text("找不到"),
                ),
                firstPageProgressIndicatorBuilder: (context) =>
                const LoadingIndicator(),
                newPageProgressIndicatorBuilder: (context) =>
                const LoadingIndicator(),
                noMoreItemsIndicatorBuilder: (context) => Center(
                  child: Text("沒有了"),
                ),
                transitionDuration: const Duration(seconds: 1),
                animateTransitions: true,
              ),
            ),
          );
        });
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
