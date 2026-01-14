import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:auto_route/auto_route.dart';
import 'package:news_hub/presentation/components/cards/post/single_image_post_layout.dart';
import 'package:news_hub/presentation/router/router.gr.dart';

import '../../../../helpers/test_data_factory.dart';

class FakePageRouteInfo extends Fake implements PageRouteInfo {}

class MockStackRouter extends Mock implements StackRouter {}

void main() {
  late MockStackRouter mockRouter;
  final tPost = TestDataFactory.createSingleImagePostWithExtension();

  setUpAll(() {
    registerFallbackValue(FakePageRouteInfo());
    registerFallbackValue(
      ThreadDetailRoute(threadId: '', extensionPkgName: '', boardId: ''),
    );
  });

  setUp(() {
    mockRouter = MockStackRouter();
    when(() => mockRouter.push(any())).thenAnswer((_) async => null);
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: StackRouterScope(
        controller: mockRouter,
        stateHash: 0,
        child: Scaffold(body: SingleImagePostCard(thread: tPost)),
      ),
    );
  }

  group('SingleImagePostCard', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text(tPost.title ?? ''), findsOneWidget);
      expect(find.text(tPost.authorName), findsOneWidget);
    });

    testWidgets('navigates to detail on tap', (tester) async {
      registerFallbackValue(
        ThreadDetailRoute(threadId: '1', extensionPkgName: 'pkg', boardId: '1'),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(SingleImagePostCard));
      await tester.pump();

      verify(
        () => mockRouter.push(any(that: isA<ThreadDetailRoute>())),
      ).called(1);
    });
  });
}
