import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

const defaultAppBarTitle = 'NewsHub';

@lazySingleton
class AppBarTitleNotifier extends ChangeNotifier {
  String _title = defaultAppBarTitle;

  String get title => _title;

  void updateTitle(String newTitle) {
    if (_title == newTitle) return;
    _title = newTitle;
    notifyListeners();
  }

  void reset() {
    updateTitle(defaultAppBarTitle);
  }
}
