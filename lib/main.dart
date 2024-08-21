import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_platform/universal_platform.dart';
import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  if (!UniversalPlatform.isWeb) {
    var path = await getApplicationSupportDirectory();
    Hive.init(path
        .path); //TODO QUANDO FOR AUTERADO O BANCO DE DADOS TROCAR AQUI, OU REMOVER
  }

  runApp(EasyLocalization(
    startLocale: const Locale("pt", "BR"),
    fallbackLocale: const Locale("pt", "BR"),
    supportedLocales: const [
      Locale('pt', 'BR'),
      Locale('en', 'US'),
      Locale('es', 'ES'),
      Locale('fr', 'FR'),
    ],
    path: 'assets/translation', //TODO: ALTERAR AQUI
    child: ModularApp(module: AppModule(), child: const AppWidget()),
  ));
}
