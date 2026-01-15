import 'dart:async';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mocktail/mocktail.dart';
import 'package:auto_route/auto_route.dart';
import 'package:news_hub/presentation/pages/thread/detail/bloc/thread_detail_cubit.dart';
import 'package:news_hub/presentation/pages/thread/detail/view/thread_detail_screen.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';
import '../../../../../helpers/test_data_factory.dart';

class MockThreadDetailCubit extends MockCubit<ThreadDetailState>
    implements ThreadDetailCubit {}

class MockStackRouter extends Mock implements StackRouter {}

class FakePageRouteInfo extends Fake implements PageRouteInfo {}

void main() {
  late MockThreadDetailCubit mockCubit;
  late MockStackRouter mockRouter;
  late PagingController<int, ArticlePostWithExtension> pagingController;
  late StreamController<Widget> overlayController;

  const tExtPkg = 'pkg';
  const tBoardId = 'board_1';
  const tThreadId = 'thread_1';
  final tPost = TestDataFactory.createArticlePost(
    id: tThreadId,
    title: 'Thread Title',
  );
  final tPostWithExt = TestDataFactory.createArticlePostWithExtension(
    post: tPost,
  );

  setUpAll(() {
    registerFallbackValue(FakePageRouteInfo());
  });

  setUp(() {
    mockCubit = MockThreadDetailCubit();
    mockRouter = MockStackRouter();
    pagingController = PagingController<int, ArticlePostWithExtension>(
      firstPageKey: 0,
    );
    overlayController = StreamController<Widget>.broadcast();

    when(() => mockRouter.push(any())).thenAnswer((_) async => null);

    when(() => mockCubit.pagingController).thenReturn(pagingController);
    when(() => mockCubit.overlayController).thenReturn(overlayController);
    when(() => mockCubit.state).thenReturn(
      ThreadDetailState(
        extensionPkgName: tExtPkg,
        boardId: tBoardId,
        threadId: tThreadId,
        threadMap: {tThreadId: Result.completed(tPostWithExt)},
        repliesMap: {},
      ),
    );
    when(
      () => mockCubit.init(
        extensionPkgName: any(named: 'extensionPkgName'),
        boardId: any(named: 'boardId'),
        threadId: any(named: 'threadId'),
      ),
    ).thenAnswer((_) async {});
    when(() => mockCubit.refresh()).thenAnswer((_) async {});
  });

  tearDown(() {
    pagingController.dispose();
    overlayController.close();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: StackRouterScope(
        controller: mockRouter,
        stateHash: 0,
        child: BlocProvider<ThreadDetailCubit>.value(
          value: mockCubit,
          child: const ThreadDetailScreen(
            extensionPkgName: tExtPkg,
            boardId: tBoardId,
            threadId: tThreadId,
          ),
        ),
      ),
    );
  }

  group('ThreadDetailScreen', () {
    testWidgets('renders AppBar with title', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text(tPost.title ?? ''), findsOneWidget);
    });

    testWidgets('renders PagedListView', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump(const Duration(milliseconds: 100));

      expect(
        find.byType(PagedListView<int, ArticlePostWithExtension>),
        findsOneWidget,
      );
    });
  });
}
