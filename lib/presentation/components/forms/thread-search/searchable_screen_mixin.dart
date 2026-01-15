import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:news_hub/presentation/components/forms/thread-search/search_mode_notifier.dart';

mixin SearchableScreenMixin<T extends StatefulWidget> on State<T> {
  void onSearchTriggered();

  @override
  void initState() {
    super.initState();
    GetIt.I<SearchModeNotifier>().addListener(_handleSearchModeChange);
  }

  void _handleSearchModeChange() {
    if (GetIt.I<SearchModeNotifier>().isSearchMode) {
      onSearchTriggered();
    }
  }

  @override
  void dispose() {
    GetIt.I<SearchModeNotifier>().removeListener(_handleSearchModeChange);
    super.dispose();
  }
}
