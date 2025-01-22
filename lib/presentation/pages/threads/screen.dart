part of 'index.dart';

@RoutePage()
class ThreadsScreen extends StatefulWidget {
  ThreadsScreen({super.key});

  final router = sl<AppRouter>();

  @override
  State<ThreadsScreen> createState() => _State();
}

class _State extends State<ThreadsScreen> {
  ThreadsCubit get cubit  => context.read<ThreadsCubit>();

  @override
  void initState() {
    super.initState();
    cubit.loadThreads();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Threads"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => widget.router.push(SearchRoute()),
          ),
        ],
      ),
      body: BlocBuilder<ThreadsCubit, ThreadsState>(builder: (context, state) {
        switch (state) {
          case ThreadsLoading _:
            return const Center(child: CircularProgressIndicator());
          case ThreadsError _:
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              ),
            );
          case ThreadsSuccess _:
            final threads = state.threads.map((t) => t.masterPost).toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                itemCount: threads.length,
                itemBuilder: (context, index) {
                  return PostCard(
                    boardName: 'Board Name',
                    post: threads[index],
                  );
                },
              ),
            );
          default:
            return const Center(child: Text('No threads remote.'));
        }
      }),
    );
  }
}
