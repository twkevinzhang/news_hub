import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/extension/interactor/uninstall_extension.dart';
import 'package:news_hub/domain/extension/repository.dart';

import '../../../helpers/test_data_factory.dart';

class MockExtensionRepository extends Mock implements ExtensionRepository {}

void main() {
  late UninstallExtension useCase;
  late MockExtensionRepository mockRepo;

  setUpAll(() {
    registerFallbackValue(TestDataFactory.createExtension());
  });

  setUp(() {
    mockRepo = MockExtensionRepository();
    useCase = UninstallExtension(repository: mockRepo);
  });

  final tExtension = TestDataFactory.createExtension();

  test('應該呼叫 repository.uninstall 並傳入正確 extension', () async {
    // Arrange
    when(() => mockRepo.uninstall(any())).thenAnswer((_) async {});

    // Act
    await useCase(tExtension);

    // Assert
    verify(() => mockRepo.uninstall(tExtension)).called(1);
  });
}
