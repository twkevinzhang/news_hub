import 'package:dartx/dartx.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/extension/interactor/install_extension.dart';
import 'package:news_hub/domain/extension/repository.dart';

import '../../../helpers/test_data_factory.dart';

class MockExtensionRepository extends Mock implements ExtensionRepository {}

void main() {
  late InstallExtension useCase;
  late MockExtensionRepository mockRepo;

  setUpAll(() {
    registerFallbackValue(TestDataFactory.createExtension());
  });

  setUp(() {
    mockRepo = MockExtensionRepository();
    useCase = InstallExtension(repository: mockRepo);
  });

  final tExtension = TestDataFactory.createExtension();

  test('應該呼叫 repository.install 並回傳 stream', () {
    // Arrange
    when(
      () => mockRepo.install(any()),
    ).thenAnswer((_) => Stream.value(Pair(InstallStatus.downloading, 0.5)));

    // Act
    final result = useCase(tExtension);

    // Assert
    expect(result, emitsInOrder([Pair(InstallStatus.downloading, 0.5)]));
    verify(() => mockRepo.install(tExtension)).called(1);
  });
}
