import 'package:flutter/material.dart';

class LanguageEntity {
  int id;
  String name;
  Locale locale;
  bool active;

  LanguageEntity({required this.active, required this.id, required this.name, required this.locale});
}
