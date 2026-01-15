import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/extension/interactor/list_remote_extensions.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

import '../../../helpers/test_data_factory.dart';

class MockExtensionRepository extends Mock implements ExtensionRepository {}

void main() {
  late ListRemoteExtensions useCase;
  late MockExtensionRepository mockRepo;

  setUp(() {
    mockRepo = MockExtensionRepository();
    useCase = ListRemoteExtensions(repository: mockRepo);
  });

  final tRemoteExtensions = [TestDataFactory.createRemoteExtension()];

  test('當成功時應該回傳 remote extensions 列表', () async {
    // Arrange
    when(
      () => mockRepo.listRemote(),
    ).thenAnswer((_) async => tRemoteExtensions);

    // Act
    final result = await useCase();

    // Assert
    expect(result, isA<ResultCompleted<List<RemoteExtension>>>());
    expect((result as ResultCompleted).data, tRemoteExtensions);
    verify(() => mockRepo.listRemote()).called(1);
  });

  test('當發生例外時應該回傳 Result.error', () async {
    // Arrange
    final tException = Exception('Network error');
    when(() => mockRepo.listRemote()).thenThrow(tException);

    // Act
    final result = await useCase();

    // Assert
    expect(result, isA<ResultError<List<RemoteExtension>>>());
    expect((result as ResultError).error, tException);
  });
}
