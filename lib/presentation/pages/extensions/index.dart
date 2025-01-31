library;

import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:news_hub/domain/search_config/index.dart';
import 'package:news_hub/domain/extension/index.dart';
import 'package:news_hub/domain/model/index.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/router.dart';
import 'package:news_hub/presentation/widgets/text_divider.dart';

part 'screen.dart';
part 'cubit.dart';
part 'index.g.dart';
