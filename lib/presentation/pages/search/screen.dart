part of 'index.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchCubit>(),
      child: _SearchView(),
    );
  }
}

class _SearchView extends StatelessWidget {
  final router = sl<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      final cubit = context.read<SearchCubit>();
      final views = [
        _buildEnableExtensionsView(context),
        _buildThreadsSortingView(context),
        _buildKeywordsView(context),
      ];
      final isLatest = state.currentStep == views.length - 1;
      return Scaffold(
        appBar: AppBar(
          title: Text("搜尋條件設定"),
        ),
        body: Column(
          children: [
            EasyStepper(
              activeStep: state.currentStep,
              showLoadingAnimation: false,
              enableStepTapping: false,
              steps: [
                EasyStep(
                  icon: Icon(Icons.checklist),
                  title: 'Enable\nExtensions',
                ),
                EasyStep(
                  icon: Icon(Icons.sort),
                  title: 'Threads\nSorting',
                ),
                EasyStep(
                  icon: Icon(Icons.search),
                  title: 'Keywords',
                ),
              ],
              onStepReached: (index) {
                cubit.updateStep(index);
              },
            ),
            Expanded(
              child: PageView.builder(
                controller: cubit.pageController,
                onPageChanged: (page) => cubit.updateStep(page),
                itemCount: views.length,
                itemBuilder: (context, index) => views[index],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: isLatest ? Icon(Icons.search) : Icon(Icons.arrow_forward),
            onPressed: () {
              isLatest
                  ? router.popForced(state.searchConfig)
                  : cubit.nextStep();
            }),
      );
    });
  }

  Widget _buildEnableExtensionsView(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      final cubit = context.read<SearchCubit>();
      return ListView(
        children: [
          ...state.allExtensions
              .filter((e) => state.searchConfig.enabledExtensionPkgNames
              .contains(e.pkgName))
              .flatMap((e) => e.boards
              .filter(
                  (b) => state.searchConfig.enabledBoardIds.contains(b.id))
              .map((b) => ListTile(
            title: Text("[${e.displayName}] ${b.name}"),
            trailing: DropdownButton(
              items: b.supportedThreadsSorting.map((s) {
                return DropdownMenuItem(
                  value: s,
                  child: Text(s),
                );
              }).toList(),
              value: state.searchConfig.threadsSorting[b.id] ??
                  b.supportedThreadsSorting.first,
              onChanged: (value) {
                if (value != null) {
                  cubit.changeThreadsSorting(b.id, value);
                }
              },
            ),
          ))),
          ListTile(title: TextDivider("未啟用")),
          ...state.allExtensions
              .filter((e) => !state.searchConfig.enabledExtensionPkgNames
              .contains(e.pkgName))
              .map((e) => ListTile(
            title: Text("[${e.displayName}]"),
          )),
        ],
      );
    });
  }

  Widget _buildThreadsSortingView(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      final cubit = context.read<SearchCubit>();
      return ListView(
        children: [
          ...state.allExtensions
              .filter((e) => state.searchConfig.enabledExtensionPkgNames
              .contains(e.pkgName))
              .flatMap((e) => e.boards
              .filter(
                  (b) => state.searchConfig.enabledBoardIds.contains(b.id))
              .map((b) => ListTile(
            title: Text("[${e.displayName}] ${b.name}"),
            trailing: DropdownButton(
              items: b.supportedThreadsSorting.map((s) {
                return DropdownMenuItem(
                  value: s,
                  child: Text(s),
                );
              }).toList(),
              value: state.searchConfig.threadsSorting[b.id] ??
                  b.supportedThreadsSorting.first,
              onChanged: (value) {
                if (value != null) {
                  cubit.changeThreadsSorting(b.id, value);
                }
              },
            ),
          ))),
          ListTile(title: TextDivider("未啟用")),
          ...state.allExtensions
              .filter((e) => !state.searchConfig.enabledExtensionPkgNames
              .contains(e.pkgName))
              .map((e) => ListTile(
            title: Text("[${e.displayName}]"),
          )),
        ],
      );
    });
  }

  Widget _buildKeywordsView(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      final cubit = context.read<SearchCubit>();
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            SearchAnchor(
                viewOnChanged: (text) => cubit.changeKeywords(text),
                viewOnSubmitted: (text) => router.popForced(state.searchConfig),
                builder: (BuildContext context, SearchController controller) =>
                    SearchBar(
                      controller: controller,
                      padding: const WidgetStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16)),
                      onTap: () {
                        controller.openView();
                      },
                      onChanged: (text) {
                        controller.openView();
                      },
                      leading: const Icon(Icons.search),
                    ),
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        controller.closeView(item);
                      },
                    );
                  });
                }),
          ],
        ),
      );
    });
  }
}
