library domain.extension;

import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension_repo/index.dart';
import 'package:news_hub/domain/model/index.dart';
import 'package:news_hub/app/service/preferences/preference.dart';
import 'package:news_hub/presentation/pages/search/index.dart';
import 'package:news_hub/shared/model.dart';
import 'package:rxdart/rxdart.dart';

part 'install_service.dart';
part 'api_service.dart';
part 'preferences_service.dart';
part 'interactor/list_extensions.dart';
part 'interactor/list_remote_extensions.dart';
part 'interactor/list_threads.dart';
part 'interactor/list_installed_extensions.dart';
