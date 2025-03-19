import 'dart:async';
import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:serious_python/serious_python.dart';

/// [ExtensionInstallServiceImpl] download and install flask extension from _installFolder.
@Environment(AppEnv.localAdapter)
@Environment(AppEnv.remoteAdapter)
@preResolve
@LazySingleton(as: ExtensionInstallService)
class ExtensionInstallServiceImpl implements ExtensionInstallService {
  ExtensionInstallServiceImpl._();
  @factoryMethod
  static Future<ExtensionInstallService> create() async {
    return ExtensionInstallServiceImpl._();
  }

  @override
  Stream<int> downloadAndInstall(String zipUrl, Extension extension) async* {
    await SeriousPython.run(
      adapterAsset,
      appFileName: "download_and_install.py",
      sync: true,
      environmentVariables: {
        "URL": zipUrl,
        "PKG_NAME": extension.pkgName,
      },
    );
    yield 100;
  }

  @override
  Future<void> uninstall(Extension extension) async {
    // TODO: call uninstall_script.py
    throw UnimplementedError();
  }
}
