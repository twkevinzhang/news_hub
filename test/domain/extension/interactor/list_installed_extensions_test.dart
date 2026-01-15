import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

class MockExtensionRepository extends Mock implements ExtensionRepository {}

class MockBoardRepository extends Mock implements BoardRepository {}

void main() {
  late ListInstalledExtensions useCase;
  late MockExtensionRepository mockExtensionRepo;
  late MockBoardRepository mockBoardRepo;

  setUp(() {
    mockExtensionRepo = MockExtensionRepository();
    mockBoardRepo = MockBoardRepository();
    useCase = ListInstalledExtensions(
      repository: mockExtensionRepo,
      boardRepository: mockBoardRepo,
    );
  });

  final tExtensions = [
    const Extension(
      pkgName: 'ext.1',
      displayName: 'Ext 1',
      version: 1,
      pythonVersion: 3,
      lang: 'en',
      isNsfw: false,
    ),
  ];

  group('call', () {
    test('應回傳所有已安裝的擴充功能', () async {
      when(
        () => mockExtensionRepo.listInstalled(),
      ).thenAnswer((_) async => tExtensions);
      final result = await useCase.call();
      expect(result, isA<ResultCompleted<List<Extension>>>());
    });
  });

  group('withBoards', () {
    test('應回傳帶有看版資訊的擴充功能列表', () async {
      when(
        () => mockExtensionRepo.listInstalled(),
      ).thenAnswer((_) async => tExtensions);
      when(() => mockBoardRepo.list(any())).thenAnswer((_) async => []);

      final result = await useCase.withBoards();

      expect(result, isA<ResultCompleted<List<ExtensionWithBoards>>>());
      final data =
          (result as ResultCompleted).data as List<ExtensionWithBoards>;
      expect(data.length, 1);
      expect(data.first.pkgName, 'ext.1');
    });

    test('當 call() 失敗時，應轉發錯誤', () async {
      when(
        () => mockExtensionRepo.listInstalled(),
      ).thenThrow(Exception('Fail'));
      final result = await useCase.withBoards();
      expect(result, isA<ResultError<List<ExtensionWithBoards>>>());
    });
  });
}
