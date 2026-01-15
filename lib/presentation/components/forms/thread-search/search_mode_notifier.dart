import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchModeNotifier extends ChangeNotifier {
  bool _isSearchMode = false;

  bool get isSearchMode => _isSearchMode;

  void enterSearchMode() {
    if (_isSearchMode) return;
    _isSearchMode = true;
    notifyListeners();
  }

  void exitSearchMode() {
    if (!_isSearchMode) return;
    _isSearchMode = false;
    notifyListeners();
  }

  void toggle() {
    _isSearchMode = !_isSearchMode;
    notifyListeners();
  }
}
