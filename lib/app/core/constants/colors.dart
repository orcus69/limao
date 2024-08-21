import 'package:flutter/material.dart';

class AppColors {
  AppColors._privateConstructor();

  static final AppColors _instance = AppColors._privateConstructor();

  factory AppColors() {
    return _instance;
  }

  static const white = Colors.white;
  static const fillColor = Color(0xFF2C2D33);
  static const black = Color(0xFF0a0a0a);
  static const subtitleColor = Color(0xFF393B3D);
  static const subtitleHeadersColor = Color(0xFFA9ABAE); //Color(0xFF393B3D);
  static const green = Color(0xFF49D95A);
  static const newGreen = Color(0xFF3FAF73);
  static const orange = Color(0xFFF7931A);
  static const lightOrange = Color(0xFFF9EEC4);
  static const yellow = Color(0xFFEBC56C);

  static const borderGrey = Color(0xFFD9D9D9);
  static const grey = Color(0xFFA9ABAE);
  static const lightGrey = Color(0xFFF3F3F3);
  static const blue = Color(0xFF2FA6DC);
  static const red = Color(0xFFF85C5E);
  static const buttonsColor = Color(0xFF44474A);
  static const purple = Color(0xFF423F8E);
}
