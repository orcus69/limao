import 'package:easy_localization/easy_localization.dart';
import 'package:caracolibras/app/app_widget_store.dart';
import 'package:caracolibras/app/core/service/local_storage/i_local_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'app_language_store.g.dart';

class AppLanguageStore = _AppLanguageStoreBase with _$AppLanguageStore;

abstract class _AppLanguageStoreBase with Store {
  final AppWidgetStore appStore;
  final ILocalStorage storage;

  _AppLanguageStoreBase({
    required this.appStore,
    required this.storage,
  }) {
    loadLocale();
    reaction((_) => appLocale, (locale) {
      appStore.appContext!.setLocale(locale);
    });
  }

  @observable
  Locale appLocale = Locale("pt", "BR");

  @action
  Future<void> changeLanguage(Locale type) async {
    await storage
        .saveData(key: 'locale', data: {type.languageCode: type.countryCode});
    appLocale = type;
  }

  Future<void> loadLocale() async {
    final data = storage.getData(key: 'locale');
    if (data != null && data.isNotEmpty) {
      final firstEntry = data.entries.first;
      appLocale = Locale(firstEntry.key, firstEntry.value);
      changeLanguage(appLocale);
    }
  }
}
