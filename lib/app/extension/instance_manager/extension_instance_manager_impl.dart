import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/extension_instance_manager.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:path_provider/path_provider.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:path/path.dart' as path;
import 'package:serious_python/serious_python.dart';
import 'package:serious_python_platform_interface/serious_python_platform_interface.dart' show SeriousPythonPlatform;

@LazySingleton(as: ExtensionInstanceManager)
class ExtensionInstanceManagerImpl implements ExtensionInstanceManager {
  late Map<String, SeriousPythonPlatform> instanceMap;

  ExtensionInstanceManagerImpl() {
    instanceMap = {};
  }

  @override
  Future<void> runNew(domain.Extension extension) async {
    WidgetsFlutterBinding.ensureInitialized();
    final directory = await getApplicationSupportDirectory();
    final appPath = directory.uri.dir(installedFileFolder).dir(extension.pkgName);
    Directory.current = appPath.toFilePath();
    final entrypoint = appPath.file("main.py").toFilePath();
    SeriousPython.runProgram(entrypoint, environmentVariables: {"PYTHONUNBUFFERED": "true"});
    await Future.delayed(const Duration(seconds: 5)); // wait server launched
    debugPrint('${extension.pkgName} launched');
    instanceMap[extension.pkgName] = SeriousPythonPlatform.instance;
  }

  @override
  Future<void> close(domain.Extension extension) async {
    final instance = instanceMap[extension.pkgName];
    if (instance == null) {
      debugPrint('${extension.pkgName} not launched');
      return;
    }
    instance.terminate();
    await Future.delayed(const Duration(seconds: 5));
    instanceMap.remove(extension.pkgName);
    debugPrint('${extension.pkgName} closed');
  }
}
