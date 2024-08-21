import 'package:caracolibras/app/core/constants/colors.dart';
import 'package:caracolibras/app/core/theme/i_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';

import 'them_custom.dart';

class AppThemeLight implements IAppTheme {
  @override
  ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'regular',
      useMaterial3: true,
      extensions: [
        ThemeCustom(
          textColor: AppColors.black,
          backgroundColor: AppColors.white,
          fillColor: AppColors.fillColor,
          borderColor: AppColors.borderGrey,
          subtitleColor: AppColors.grey,
        ),
      ],
    );
  }

  @override
  String themeToString() {
    return ThemeMode.light.toString();
  }
}
