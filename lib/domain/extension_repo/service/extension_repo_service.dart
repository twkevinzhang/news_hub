import 'package:news_hub/domain/extension/model/index.dart';
import 'package:news_hub/domain/extension_repo/model/index.dart';

abstract class ExtensionRepoService {
  Future<ExtensionRepo?> detail(String baseUrl);
  Future<List<AvailableExtension>> listExtensions(String baseUrl);
}
