library app.extension;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:news_hub/app/model/index.dart';
import 'package:news_hub/app/service/preferences/preference.dart';
import 'package:news_hub/app/service/preferences/store.dart';
import 'package:news_hub/domain/extension/index.dart';
import 'package:news_hub/domain/model/index.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:path/path.dart' as path;
import 'package:serious_python/serious_python.dart';


part 'install_service_impl.dart';
part 'preferences_service_impl.dart';
part 'api_service_impl.dart';
part 'mock_api_service_impl.dart';
part 'mock_install_service_impl.dart';