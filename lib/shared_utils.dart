library shared_utils;

import 'package:flutter/material.dart';

import 'src/config.dart';
import 'src/constants.dart';

export 'package:feather_icons/feather_icons.dart';
export 'package:fluttericon/brandico_icons.dart';
export 'package:fluttericon/entypo_icons.dart';
export 'package:fluttericon/font_awesome_icons.dart';
export 'package:fluttericon/octicons_icons.dart';
export 'package:simple_animations/simple_animations.dart';

export 'src/bloc/base_bloc.dart';
export 'src/bloc/bloc_state.dart';
export 'src/colors.dart';
export 'src/constants.dart';
export 'src/durations.dart';
export 'src/extensions.dart';
export 'src/icons.dart';
export 'src/responsive.dart';
export 'src/spacing.dart';
export 'src/themes.dart';
export 'src/usecase/result.dart';
export 'src/usecase/usecase.dart';
export 'src/widgets/animated.column.dart';
export 'src/widgets/animated.list.dart';
export 'src/widgets/animated.row.dart';
export 'src/widgets/app.rounded.button.dart';
export 'src/widgets/app.text.field.dart';
export 'src/widgets/dismiss.keyboard.dart';
export 'src/widgets/empty.content.placeholder.dart';
export 'src/widgets/loading.indicator.dart';

/// initializes all utilities
@Deprecated('This function will no longer be supported in newer versions')
void initializeSharedUtils(BuildContext context) {
  try {
    /// setup device metrics
    SizeConfig.init(context);
  } catch (e) {
    logger.e('an error occurred while initializing shared_utils -> $e');
  }
}
