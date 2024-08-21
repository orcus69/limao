import 'package:caracolibras/app/app_widget_store.dart';
import 'package:caracolibras/app/core/core_module.dart';
import 'package:caracolibras/app/core/localization/app_language_store.dart';
import 'package:caracolibras/app/core/store/auth/auth_store.dart';
import 'package:caracolibras/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(AppLanguageStore.new);
    i.addSingleton<AppWidgetStore>(AppWidgetStore.new);
    i.addSingleton<AuthStore>(AuthStore.new);
  }

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    // r.module('/', module: CoreModule());
    r.module('/', module: HomeModule());
  }
}
