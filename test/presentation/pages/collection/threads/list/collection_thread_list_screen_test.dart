import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/presentation/components/navigation/app_bar_title_notifier.dart';
import 'package:news_hub/presentation/components/forms/thread-search/search_mode_notifier.dart';
import 'package:news_hub/presentation/pages/collection/:collectionId/threads/list/bloc/collection_thread_list_cubit.dart';
import 'package:news_hub/presentation/pages/collection/:collectionId/threads/list/collection_thread_list_screen.dart';
import 'package:news_hub/presentation/components/cards/post/single_image_post_layout.dart';
import 'package:news_hub/presentation/components/cards/post/single_image_post_skeleton.dart';
import '../../../../../helpers/test_data_factory.dart';

class MockCollectionThreadListCubit extends MockCubit<CollectionThreadListState>
    implements CollectionThreadListCubit {}

class MockAppBarTitleNotifier extends Mock implements AppBarTitleNotifier {}

class MockSearchModeNotifier extends Mock implements SearchModeNotifier {}

void main() {
  late MockCollectionThreadListCubit mockCubit;
  late MockAppBarTitleNotifier mockAppBarTitleNotifier;
  late MockSearchModeNotifier mockSearchModeNotifier;
  late PagingController<int, dynamic> pagingController;
  const tCollectionId = 'col1';
  final tPost = TestDataFactory.createSingleImagePostWithExtension();

  setUp(() {
    mockCubit = MockCollectionThreadListCubit();
    mockAppBarTitleNotifier = MockAppBarTitleNotifier();
    mockSearchModeNotifier = MockSearchModeNotifier();
    pagingController = PagingController<int, dynamic>(firstPageKey: 0);

    // Register mocks in GetIt
    final sl = GetIt.instance;
    if (sl.isRegistered<AppBarTitleNotifier>()) {
      sl.unregister<AppBarTitleNotifier>();
    }
    if (sl.isRegistered<SearchModeNotifier>()) {
      sl.unregister<SearchModeNotifier>();
    }
    sl.registerSingleton<AppBarTitleNotifier>(mockAppBarTitleNotifier);
    sl.registerSingleton<SearchModeNotifier>(mockSearchModeNotifier);

    when(() => mockSearchModeNotifier.isSearchMode).thenReturn(false);
    when(() => mockSearchModeNotifier.addListener(any())).thenReturn(null);
    when(() => mockSearchModeNotifier.removeListener(any())).thenReturn(null);

    when(() => mockCubit.pagingController).thenReturn(pagingController);
    when(() => mockCubit.state).thenReturn(const CollectionThreadListState());
    when(() => mockCubit.init(any())).thenAnswer((_) async {});
  });

  tearDown(() {
    pagingController.dispose();
    GetIt.instance.reset();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<CollectionThreadListCubit>.value(
        value: mockCubit,
        child: CollectionThreadListScreen(collectionId: tCollectionId),
      ),
    );
  }

  group('CollectionThreadListScreen', () {
    testWidgets('calls init on start', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump(const Duration(milliseconds: 100));

      verify(() => mockCubit.init(tCollectionId)).called(1);
    });

    testWidgets('renders list items when paging controller has data', (
      tester,
    ) async {
      pagingController.value = PagingState(
        nextPageKey: null,
        itemList: [tPost],
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(SingleImagePostCard), findsOneWidget);
      expect(find.text(tPost.title ?? ''), findsOneWidget);
    });

    testWidgets('renders loading skeletons', (tester) async {
      pagingController.value = PagingState(
        nextPageKey: null,
        itemList: [const CollectionBoardSkeleton('b1')],
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(SingleImagePostSkeleton), findsOneWidget);
    });

    testWidgets('updates app bar title on state change', (tester) async {
      final tCollection = TestDataFactory.createCollection(name: 'New Name');

      whenListen(
        mockCubit,
        Stream.fromIterable([
          CollectionThreadListState(collection: tCollection),
        ]),
        initialState: const CollectionThreadListState(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      verify(() => mockAppBarTitleNotifier.updateTitle('New Name')).called(1);
    });
  });
}
