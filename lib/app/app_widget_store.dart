import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'app_widget_store.g.dart';

class AppWidgetStore = _AppWidgetStoreBase with _$AppWidgetStore;

abstract class _AppWidgetStoreBase with Store {
  BuildContext? appContext;

  @action
  setContext(BuildContext value) => appContext = value;


  @observable
  bool isDark = true;
  

  @action
  void changeTheme() {
    isDark = !isDark;
  }
}
