import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/repo/repository.dart';
import 'package:news_hub/domain/repo/interactor/list_repos.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

class MockRepoRepository extends Mock implements RepoRepository {}

void main() {
  late ListRepos useCase;
  late MockRepoRepository mockRepo;

  setUp(() {
    mockRepo = MockRepoRepository();
    useCase = ListRepos(mockRepo);
  });

  test('應回傳倉庫列表', () async {
    final List<Repo> tRepos = [
      Repo(
        baseUrl: 'url',
        displayName: 'name',
        website: 'web',
        signingKeyFingerprint: 'key',
      ),
    ];
    when(() => mockRepo.list()).thenAnswer((_) async => tRepos);

    final result = await useCase.call();

    expect(result, isA<ResultCompleted<List<Repo>>>());
    expect((result as ResultCompleted).data, tRepos);
  });
}
