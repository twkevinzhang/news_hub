import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/presentation/router/router.gr.dart';

@injectable
class HomeGuard extends AutoRouteGuard {
  final CollectionRepository _collectionRepository;

  HomeGuard(this._collectionRepository);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // 獲取所有收藏
    final collections = await _collectionRepository.list();

    if (collections.isNotEmpty) {
      // 如果有收藏，導航到第一個收藏
      resolver.next(false);
      router.replace(
        CollectionThreadListRoute(collectionId: collections.first.id),
      );
    } else {
      // 如果沒有收藏，允許導航到 HomeEmptyRoute
      resolver.next(true);
    }
  }
}
