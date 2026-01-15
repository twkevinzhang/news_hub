import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/repo/interactor/remove_repo.dart';
import 'package:news_hub/domain/repo/repository.dart';

class MockRepoRepository extends Mock implements RepoRepository {}

void main() {
  late RemoveRepo useCase;
  late MockRepoRepository mockRepo;

  setUp(() {
    mockRepo = MockRepoRepository();
    useCase = RemoveRepo(mockRepo);
  });

  const tUrl = 'https://example.com/repo.json';

  test('應該呼叫 repository.delete 並傳入正確 URL', () async {
    // Arrange
    when(() => mockRepo.delete(any())).thenAnswer((_) async {});

    // Act
    await useCase(tUrl);

    // Assert
    verify(() => mockRepo.delete(tUrl)).called(1);
  });
}
