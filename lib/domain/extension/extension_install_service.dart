import 'package:news_hub/domain/models/models.dart';

enum ZipStatus {
  reading,
  extracting,
}

abstract class ExtensionInstallService {
  Stream<int> download(String zipUrl, Extension extension);

  Stream<ZipStatus> install(Extension extension);

  Future<void> removeZip(Extension extension);

  Future<void> uninstall(Extension extension);
}
