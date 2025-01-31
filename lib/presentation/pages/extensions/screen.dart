part of 'index.dart';

@RoutePage()
class ExtensionsScreen extends StatelessWidget {
  const ExtensionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ExtensionsCubit>(),
      child: _ExtensionsView(),
    );
  }
}

class _ExtensionsView extends StatefulWidget {
  _ExtensionsView({super.key});

  final router = sl<AppRouter>();

  @override
  State<_ExtensionsView> createState() => _ExtensionsViewState();
}

class _ExtensionsViewState extends State<_ExtensionsView> {
  @override
  void initState() {
    super.initState();
    context.read<ExtensionsCubit>().loadExtensions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExtensionsCubit, ExtensionsState>(
        builder: (context, state) {
      final cubit = context.read<ExtensionsCubit>();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Extensions'),
          actions: [
            SearchAnchor(
                viewOnChanged: (text) => cubit.changeKeywords(text),
                viewOnSubmitted: (text) {
                  cubit.loadExtensions();
                  cubit.searchController.closeView(text);
                },
                isFullScreen: true,
                searchController: cubit.searchController,
                builder: (BuildContext context, SearchController controller) {
                  return IconButton(
                    icon: const Icon(Icons.filter_list_outlined),
                    onPressed: () {
                      controller.openView();
                    },
                  );
                },
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        cubit.changeKeywords(item);
                        controller.closeView(item);
                      },
                    );
                  });
                }),
            IconButton(
              icon: const Icon(Icons.add_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          children: [
            if (state.extensions.updates.isNotEmpty) ...[
              ListTile(title: TextDivider("等待更新")),
              ...state.extensions.updates.map((e) => ListTile(
                    title: Text("${e.displayName}"),
                    trailing: IconButton(
                      icon: Icon(Icons.update),
                      onPressed: () => {
                        cubit.updateExtension(e),
                      },
                    ),
                  ))
            ],
            if (state.extensions.installed.isNotEmpty) ...[
              ListTile(title: TextDivider("已安裝")),
              ...state.extensions.installed.map((e) => ListTile(
                    title: Text("${e.displayName}"),
                  ))
            ],
            if (state.extensions.notInstalled.isNotEmpty) ...[
              ListTile(title: TextDivider("未安裝")),
              ...state.extensions.notInstalled.map((e) => ListTile(
                    title: Text("${e.displayName}"),
                    trailing: IconButton(
                      icon: Icon(Icons.download),
                      onPressed: () => {
                        cubit.installExtension(e),
                      },
                    ),
                  ))
            ],
          ],
        ),
      );
    });
  }
}
