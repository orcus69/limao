import 'package:caracolibras/app/core/constants/colors.dart';
import 'package:caracolibras/app/core/theme/i_app_theme.dart';
import 'package:flutter/material.dart';
import 'them_custom.dart';

class AppThemeDark implements IAppTheme {
  @override
  ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'regular',
      useMaterial3: true,
      extensions: [
        ThemeCustom(
          textColor: const Color(0xFFFFFFFF),
          backgroundColor: Color(0xFF1E1E1E),
          fillColor: AppColors.fillColor,
          borderColor: const Color(0xFF585858),
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
