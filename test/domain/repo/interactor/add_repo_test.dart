import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/repo/interactor/add_repo.dart';
import 'package:news_hub/domain/repo/repository.dart';

class MockRepoRepository extends Mock implements RepoRepository {}

void main() {
  late AddRepo useCase;
  late MockRepoRepository mockRepo;

  setUp(() {
    mockRepo = MockRepoRepository();
    useCase = AddRepo(mockRepo);
  });

  const tUrl = 'https://example.com/repo.json';

  test('應該呼叫 repository.insert 並傳入正確 URL', () async {
    // Arrange
    when(() => mockRepo.insert(any())).thenAnswer((_) async {});

    // Act
    await useCase(url: tUrl);

    // Assert
    verify(() => mockRepo.insert(tUrl)).called(1);
  });
}
