library threads;

import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/extension/index.dart';
import 'package:news_hub/domain/model/index.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/router.dart';
import 'package:news_hub/presentation/router.gr.dart';
import 'package:news_hub/presentation/widgets/post_card.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:injectable/injectable.dart';

part 'cubit.dart';
part 'screen.dart';
