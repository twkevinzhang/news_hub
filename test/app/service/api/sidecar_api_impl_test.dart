import 'dart:async';
import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/app/service/api/models/sidecar_api.pbgrpc.dart';
import 'package:news_hub/app/service/api/models/sidecar_api.pb.dart' as pb;
import 'package:news_hub/app/service/api/models/domain_models.pb.dart'
    as domain_pb;
import 'package:news_hub/app/service/api/sidecar_api_impl.dart';
import 'package:news_hub/app/service/connection/grpc_connection_manager_impl.dart';

class MockGrpcConnectionManagerImpl extends Mock
    implements GrpcConnectionManagerImpl {}

class MockSidecarApiClient extends Mock implements SidecarApiClient {}

class MockClientChannel extends Mock implements ClientChannel {}

class FakeResponseFuture<T> implements ResponseFuture<T> {
  final Future<T> _future;
  FakeResponseFuture(this._future);

  @override
  Stream<T> asStream() => _future.asStream();

  @override
  Future<T> catchError(Function onError, {bool Function(Object error)? test}) =>
      _future.catchError(onError, test: test);

  @override
  Future<R> then<R>(
    FutureOr<R> Function(T value) onValue, {
    Function? onError,
  }) => _future.then(onValue, onError: onError);

  @override
  Future<T> whenComplete(FutureOr Function() action) =>
      _future.whenComplete(action);

  @override
  Future<T> timeout(Duration timeLimit, {FutureOr<T> Function()? onTimeout}) =>
      _future.timeout(timeLimit, onTimeout: onTimeout);

  @override
  Future<void> cancel() async {}

  @override
  Future<Map<String, String>> get headers => Future.value({});

  @override
  Future<Map<String, String>> get trailers => Future.value({});
}

void main() {
  late SidecarApiImpl apiService;
  late MockGrpcConnectionManagerImpl mockConnectionManager;
  late MockSidecarApiClient mockClient;
  late MockClientChannel mockChannel;

  setUpAll(() {
    registerFallbackValue(pb.GetBoardsReq());
    registerFallbackValue(pb.GetThreadsReq());
    registerFallbackValue(pb.GetOriginalPostReq());
    registerFallbackValue(domain_pb.PaginationReq());
    registerFallbackValue(domain_pb.Empty());
  });

  setUp(() {
    mockConnectionManager = MockGrpcConnectionManagerImpl();
    mockClient = MockSidecarApiClient();
    mockChannel = MockClientChannel();

    when(() => mockConnectionManager.getChannel()).thenReturn(mockChannel);

    apiService = SidecarApiImpl(
      connectionManager: mockConnectionManager,
      clientFactory: (_) => mockClient,
    );
  });

  group('SidecarApiImpl', () {
    const tPkgName = 'com.example.ext';

    test('listBoards calls client.getBoards and returns mapped data', () async {
      final tBoards = <domain_pb.Board>[
        domain_pb.Board(
          id: 'b1',
          name: 'Board 1',
          url: 'url1',
          icon: 'icon1',
          supportedThreadsSorting: [],
          pkgName: tPkgName,
        ),
      ];
      final res = pb.GetBoardsRes(boards: tBoards);

      when(
        () => mockClient.getBoards(any()),
      ).thenAnswer((_) => FakeResponseFuture(Future.value(res)));

      final result = await apiService.listBoards(extensionPkgName: tPkgName);

      expect(result.length, 1);
      expect(result.first.id, 'b1');
      verify(() => mockClient.getBoards(any())).called(1);
    });

    test('listThreads calls client.getThreads', () async {
      final tThreads = <domain_pb.Post>[
        domain_pb.Post(
          id: 't1',
          boardId: 'b1',
          pkgName: tPkgName,
          articlePost: domain_pb.ArticlePost(
            title: 'Thread 1',
            createdAt: Int64(0),
          ),
        ),
      ];
      final res = pb.GetThreadsRes(threads: tThreads);
      when(
        () => mockClient.getThreads(any()),
      ).thenAnswer((_) => FakeResponseFuture(Future.value(res)));

      final result = await apiService.listThreads(
        extensionPkgName: tPkgName,
        boardId: 'b1',
      );

      expect(result.length, 1);
      expect(result.first.id, 't1');
      verify(() => mockClient.getThreads(any())).called(1);
    });

    test('getOriginalPost calls client.getOriginalPost', () async {
      final tPost = domain_pb.Post(
        id: 't1',
        boardId: 'b1',
        pkgName: tPkgName,
        articlePost: domain_pb.ArticlePost(
          title: 'Thread 1',
          createdAt: Int64(0),
          authorId: 'a1',
          authorName: 'Author',
          tags: [],
        ),
      );
      final res = pb.GetOriginalPostRes(originalPost: tPost);
      when(
        () => mockClient.getOriginalPost(any()),
      ).thenAnswer((_) => FakeResponseFuture(Future.value(res)));

      final result = await apiService.getOriginalPost(
        extensionPkgName: tPkgName,
        boardId: 'b1',
        threadId: 't1',
      );

      expect(result.id, 't1');
      verify(() => mockClient.getOriginalPost(any())).called(1);
    });
  });
}
