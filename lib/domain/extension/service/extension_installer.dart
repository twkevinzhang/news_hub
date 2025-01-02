import 'package:dartx/dartx.dart';
import 'package:news_hub/domain/extension/model/index.dart';
import 'dart:async';

abstract class ExtensionInstaller {

  Stream<Pair<String, int>> download(String zipUrl, Extension extension);

  Stream<String> install(Extension extension);

  Future<void> uninstall(Extension extension);

  Future<List<LoadResult>> listInstalledExtensions();
}

sealed class LoadResult {}

class LoadResultSuccess extends LoadResult {
  final InstalledExtension extension;

  LoadResultSuccess(this.extension);
}

class LoadResultUntrusted extends LoadResult {
  final UntrustedExtension extension;

  LoadResultUntrusted(this.extension);
}

class LoadResultError extends LoadResult {}
