import 'package:news_hub/domain/models/models.dart';

abstract class ExtensionInstanceManager {
  Future<void> runNew(Extension extension);
  Future<void> close(Extension extension);
}
