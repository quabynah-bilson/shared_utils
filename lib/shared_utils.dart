library shared_utils;

import 'package:flutter/material.dart';
import 'src/config.dart';

export 'src/colors.dart';
export 'src/config.dart';
export 'src/constants.dart';
export 'src/durations.dart';
export 'src/extensions.dart';
export 'src/icons.dart';
export 'src/spacing.dart';
export 'src/themes.dart';
export 'src/responsive.dart';
export 'src/usecase/result.dart';
export 'src/usecase/usecase.dart';
export 'src/bloc/base_bloc.dart';
export 'src/bloc/bloc_state.dart';

/// initializes all utilities
void initializeSharedUtils(BuildContext context) {
  try {
    /// setup device metrics
    SizeConfig.init(context);
  } catch (e) {
    debugPrint('an error occurred while intializing shared_utils -> $e');
  }
}
