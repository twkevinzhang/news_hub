import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:news_hub/domain/search_config/index.dart';
import 'package:news_hub/domain/extension/index.dart';
import 'package:news_hub/domain/model/index.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/router/router.dart';
import 'package:news_hub/presentation/widgets/text_divider.dart';

import 'cubit.dart';

// TODO: implement Declarative Navigation https://github.com/Milad-Akarie/auto_route_library/blob/master/auto_route/example/lib/declarative/declarative.router.dart
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
                  ? AutoRouter.of(context).popForced(state.searchConfig)
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SearchAnchor(
                viewOnChanged: (text) => cubit.changeKeywords(text),
                viewOnSubmitted: (text) => AutoRouter.of(context).popForced(state.searchConfig),
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
