import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/presentation/pages/collection/:collectionId/threads/list/bloc/collection_thread_list_cubit.dart';
import 'package:news_hub/presentation/pages/collection/:collectionId/threads/list/collection_thread_list_screen.dart';
import 'package:news_hub/presentation/pages/home/home_cubit.dart';
import 'package:news_hub/presentation/components/cards/post/single_image_post_layout.dart';
import 'package:news_hub/presentation/components/cards/post/single_image_post_skeleton.dart';
import '../../../../../helpers/test_data_factory.dart';

class MockCollectionThreadListCubit extends MockCubit<CollectionThreadListState>
    implements CollectionThreadListCubit {}

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
  late MockCollectionThreadListCubit mockCubit;
  late MockHomeCubit mockHomeCubit;
  late PagingController<int, dynamic> pagingController;
  final tCollectionId = 'col1';
  final tPost = TestDataFactory.createSingleImagePostWithExtension();

  setUp(() {
    mockCubit = MockCollectionThreadListCubit();
    mockHomeCubit = MockHomeCubit();
    pagingController = PagingController<int, dynamic>(firstPageKey: 0);

    when(() => mockCubit.pagingController).thenReturn(pagingController);
    when(() => mockCubit.state).thenReturn(const CollectionThreadListState());
    when(() => mockCubit.init(any())).thenAnswer((_) async {});
    when(() => mockHomeCubit.state).thenReturn(const HomeState());
    when(() => mockHomeCubit.updateTitle(any())).thenReturn(null);
  });

  tearDown(() {
    pagingController.dispose();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CollectionThreadListCubit>.value(value: mockCubit),
          BlocProvider<HomeCubit>.value(value: mockHomeCubit),
        ],
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

    testWidgets('updates home title on state change', (tester) async {
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

      verify(() => mockHomeCubit.updateTitle('New Name')).called(1);
    });
  });
}
