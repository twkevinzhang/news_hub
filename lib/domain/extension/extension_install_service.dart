import 'package:news_hub/domain/models/models.dart';

enum ZipStatus {
  reading,
  extracting,
}

abstract class ExtensionInstallService {
  Stream<int> downloadAndInstall(String zipUrl, Extension extension);

  Future<void> uninstall(Extension extension);
}
