import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository.dart';
import 'package:news_hub/presentation/components/forms/thread-search/search_mode_notifier.dart';
import 'package:news_hub/presentation/components/navigation/app_bar_title_notifier.dart';
import 'package:news_hub/presentation/components/navigation/app_navigation_drawer.dart';
import 'package:news_hub/presentation/pages/home/home_cubit.dart';
import 'package:auto_route/auto_route.dart';

import '../helpers/test_data_factory.dart';

class _MockHomeCubit extends Mock implements HomeCubit {}

class _MockSearchModeNotifier extends Mock implements SearchModeNotifier {}

class _MockAppBarTitleNotifier extends Mock implements AppBarTitleNotifier {}

class _MockStackRouter extends Mock implements StackRouter {}

class _FakePageRouteInfo extends Fake implements PageRouteInfo<dynamic> {}

void main() {
  late _MockHomeCubit mockHomeCubit;
  late _MockSearchModeNotifier mockSearchModeNotifier;
  late _MockAppBarTitleNotifier mockAppBarTitleNotifier;
  late _MockStackRouter mockRouter;
  late StreamController<HomeState> stateController;
  final sl = GetIt.instance;

  setUpAll(() {
    registerFallbackValue(_FakePageRouteInfo());
  });

  setUp(() {
    mockHomeCubit = _MockHomeCubit();
    mockSearchModeNotifier = _MockSearchModeNotifier();
    mockAppBarTitleNotifier = _MockAppBarTitleNotifier();
    mockRouter = _MockStackRouter();
    stateController = StreamController<HomeState>.broadcast();

    sl.registerSingleton<HomeCubit>(mockHomeCubit);
    sl.registerSingleton<SearchModeNotifier>(mockSearchModeNotifier);
    sl.registerSingleton<AppBarTitleNotifier>(mockAppBarTitleNotifier);

    // Mock SearchModeNotifier
    when(() => mockSearchModeNotifier.isSearchMode).thenReturn(false);
    when(() => mockSearchModeNotifier.addListener(any())).thenReturn(null);
    when(() => mockSearchModeNotifier.removeListener(any())).thenReturn(null);

    // Mock AppBarTitleNotifier
    when(() => mockAppBarTitleNotifier.title).thenReturn('Test Title');
    when(() => mockAppBarTitleNotifier.addListener(any())).thenReturn(null);
    when(() => mockAppBarTitleNotifier.removeListener(any())).thenReturn(null);

    // Mock StackRouter
    when(() => mockRouter.canPop()).thenReturn(false);
    when(() => mockRouter.addListener(any())).thenReturn(null);
    when(() => mockRouter.removeListener(any())).thenReturn(null);
    when(() => mockRouter.push(any())).thenAnswer((_) async => null);

    // Mock HomeCubit
    when(() => mockHomeCubit.stream).thenAnswer((_) => stateController.stream);
    when(() => mockHomeCubit.close()).thenAnswer((_) async {});
  });

  tearDown(() {
    stateController.close();
    sl.reset();
  });

  group('HomeScreen BlocSelector Rebuild Performance', () {
    testWidgets('AppNavigationDrawer 應只在相關狀態改變時 rebuild', (tester) async {
      var drawerBuildCount = 0;
      final collection1 = TestDataFactory.createCollection(
        id: '1',
        name: 'Collection 1',
      );

      const initialState = HomeState(
        collections: [],
        sidecarStatus: SidecarConnectionState.connected,
      );

      when(() => mockHomeCubit.state).thenReturn(initialState);

      // 構建測試用的 Widget 樹
      await tester.pumpWidget(
        MaterialApp(
          home: StackRouterScope(
            controller: mockRouter,
            stateHash: 0,
            child: BlocProvider<HomeCubit>.value(
              value: mockHomeCubit,
              child: Scaffold(
                appBar: AppBar(title: const Text('Test')),
                drawer:
                    BlocSelector<
                      HomeCubit,
                      HomeState,
                      (List<Collection>, String?, String, Color)
                    >(
                      selector: (state) => (
                        state.collections,
                        state.expandedCollectionId,
                        state.sidecarLabel,
                        state.sidecarStatusColor,
                      ),
                      builder: (context, data) {
                        drawerBuildCount++; // 直接在 builder 中計數
                        final (
                          collections,
                          expandedId,
                          sidecarLabel,
                          sidecarStatusColor,
                        ) = data;
                        return AppNavigationDrawer(
                          collections: collections,
                          expandedCollectionId: expandedId,
                          sidecarLabel: sidecarLabel,
                          sidecarStatusColor: sidecarStatusColor,
                          onToggleExpansion: (_) {},
                          onCollectionSelected: (_) {},
                          onCreateCollectionPressed: () {},
                          onBoardSelected: (_) {},
                          onStatusPressed: () {},
                        );
                      },
                    ),
              ),
            ),
          ),
        ),
      );

      // 打開 Drawer 以觸發 BlocSelector builder
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      // 1. 初始 build
      expect(drawerBuildCount, 1, reason: '初始渲染應該 build 一次');

      // 2. 發射不相關的狀態改變（sidecarMessage）
      // selector 不包含 sidecarMessage，所以不應該觸發 rebuild
      const newState1 = HomeState(
        collections: [],
        sidecarStatus: SidecarConnectionState.connected,
        sidecarMessage: 'New message', // 改變了，但不在 selector 中
      );

      when(() => mockHomeCubit.state).thenReturn(newState1);
      stateController.add(newState1);
      await tester.pump();

      expect(
        drawerBuildCount,
        1,
        reason: 'sidecarMessage 改變不應觸發 rebuild（不在 selector 中）',
      );

      // 3. 發射相關的狀態改變（sidecarStatus）
      // selector 包含 sidecarStatus（透過 sidecarLabel 和 sidecarStatusColor），應該觸發 rebuild
      const newState2 = HomeState(
        collections: [],
        sidecarStatus: SidecarConnectionState.failed, // 改變了，且在 selector 中
        sidecarMessage: 'New message',
      );

      when(() => mockHomeCubit.state).thenReturn(newState2);
      stateController.add(newState2);
      await tester.pump();

      expect(
        drawerBuildCount,
        2,
        reason:
            'sidecarStatus 改變應觸發 rebuild（影響 sidecarLabel 和 sidecarStatusColor）',
      );

      // 4. 再次發射不相關的狀態改變
      const newState3 = HomeState(
        collections: [],
        sidecarStatus: SidecarConnectionState.failed, // 沒變
        sidecarMessage: 'Another new message', // 改變了，但不在 selector 中
      );

      when(() => mockHomeCubit.state).thenReturn(newState3);
      stateController.add(newState3);
      await tester.pump();

      expect(drawerBuildCount, 2, reason: '再次改變 sidecarMessage 不應觸發 rebuild');

      // 5. 發射 collections 改變
      final newState4 = HomeState(
        collections: [collection1],
        sidecarStatus: SidecarConnectionState.failed,
        sidecarMessage: 'Another new message',
      );

      when(() => mockHomeCubit.state).thenReturn(newState4);
      stateController.add(newState4);
      await tester.pump();

      expect(
        drawerBuildCount,
        3,
        reason: 'collections 改變應觸發 rebuild（在 selector 中）',
      );
    });

    testWidgets('BlocSelector 應正確比較 tuple 值', (tester) async {
      var drawerBuildCount = 0;

      const initialState = HomeState(
        collections: [],
        sidecarStatus: SidecarConnectionState.connected,
      );

      when(() => mockHomeCubit.state).thenReturn(initialState);

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<HomeCubit>.value(
            value: mockHomeCubit,
            child: Scaffold(
              drawer:
                  BlocSelector<
                    HomeCubit,
                    HomeState,
                    (List<Collection>, String?, String, Color)
                  >(
                    selector: (state) => (
                      state.collections,
                      state.expandedCollectionId,
                      state.sidecarLabel,
                      state.sidecarStatusColor,
                    ),
                    builder: (context, data) {
                      drawerBuildCount++;
                      return AppNavigationDrawer(
                        collections: data.$1,
                        expandedCollectionId: data.$2,
                        sidecarLabel: data.$3,
                        sidecarStatusColor: data.$4,
                        onToggleExpansion: (_) {},
                        onCollectionSelected: (_) {},
                        onCreateCollectionPressed: () {},
                        onBoardSelected: (_) {},
                        onStatusPressed: () {},
                      );
                    },
                  ),
            ),
          ),
        ),
      );

      // 打開 Drawer 以觸發 BlocSelector builder
      final scaffoldState = tester.state<ScaffoldState>(find.byType(Scaffold));
      scaffoldState.openDrawer();
      await tester.pumpAndSettle();

      expect(drawerBuildCount, 1);

      // 發射完全相同的狀態（所有欄位都相同）
      const sameState = HomeState(
        collections: [],
        sidecarStatus: SidecarConnectionState.connected,
      );

      when(() => mockHomeCubit.state).thenReturn(sameState);
      stateController.add(sameState);
      await tester.pump();

      expect(drawerBuildCount, 1, reason: '完全相同的狀態不應觸發 rebuild');
    });
  });
}
