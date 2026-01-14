import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/domain/extension/interactor/get_installed_extension.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/shared/failures.dart';

class MockExtensionRepository extends Mock implements ExtensionRepository {}

void main() {
  late GetInstalledExtension useCase;
  late MockExtensionRepository mockRepository;

  setUp(() {
    mockRepository = MockExtensionRepository();
    useCase = GetInstalledExtension(repository: mockRepository);
  });

  const tPkgName = 'test.pkg';
  final tExtension = Extension(
    pkgName: tPkgName,
    displayName: 'Test Ext',
    version: 1,
    pythonVersion: 3,
    lang: 'zh',
    isNsfw: false,
  );

  test('當順利取得 Extension 時，應回傳 Result.completed', () async {
    // Arrange
    when(
      () => mockRepository.getInstalled(any()),
    ).thenAnswer((_) async => tExtension);

    // Act
    final result = await useCase.get(tPkgName);

    // Assert
    expect(result, isA<ResultCompleted<Extension>>());
    expect((result as ResultCompleted).data, tExtension);
    verify(() => mockRepository.getInstalled(tPkgName)).called(1);
  });

  test('當 Extension 不存在或發生錯誤時，應回傳 Result.error 包含 Failure', () async {
    // Arrange
    when(
      () => mockRepository.getInstalled(any()),
    ).thenThrow(Exception('Not found'));

    // Act
    final result = await useCase.get(tPkgName);

    // Assert
    expect(result, isA<ResultError<Extension>>());
    expect((result as ResultError).error, isA<Failure>());
  });
}
