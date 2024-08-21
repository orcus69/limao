import 'package:caracolibras/app/app_widget_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'notification_service.dart';

String? formatMoney(String value) {
  return double.parse(value).toStringAsFixed(2);
}

double getMoneyInValue(String money) {
  return double.tryParse(money.replaceFirst(".", ",")) ?? 0.0;
}

//format date to 00/00/0000
String formatDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
}

showSnackbarError(String text, {Color? background}) async {
  AppWidgetStore app = Modular.get<AppWidgetStore>();
  ScaffoldMessenger.of(app.appContext!).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: background,
    ),
  );
  // NotificationService.showNotification(app.appContext!, text, null, null);
}

showSnackbarSuccess(String text) async {
  AppWidgetStore app = Modular.get<AppWidgetStore>();
  NotificationService.showNotification(
    app.appContext!,
    text,
    'check.svg',
    Colors.green,
  );
}
