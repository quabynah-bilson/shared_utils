library shared_utils;

import 'package:flutter/material.dart';
import 'package:shared_utils/src/constants.dart';

import 'src/config.dart';

export 'package:feather_icons/feather_icons.dart';
export 'package:fluttericon/brandico_icons.dart';
export 'package:fluttericon/entypo_icons.dart';
export 'package:fluttericon/font_awesome_icons.dart';
export 'package:fluttericon/octicons_icons.dart';
export 'package:simple_animations/simple_animations.dart';

export 'src/bloc/base_bloc.dart';
export 'src/bloc/bloc_state.dart';
export 'src/colors.dart';
export 'src/config.dart';
export 'src/constants.dart';
export 'src/durations.dart';
export 'src/extensions.dart';
export 'src/icons.dart';
export 'src/responsive.dart';
export 'src/spacing.dart';
export 'src/themes.dart';
export 'src/usecase/result.dart';
export 'src/usecase/usecase.dart';

/// initializes all utilities
void initializeSharedUtils(BuildContext context) {
  try {
    /// setup device metrics
    SizeConfig.init(context);
  } catch (e) {
    logger.e('an error occurred while initializing shared_utils -> $e');
  }
}
