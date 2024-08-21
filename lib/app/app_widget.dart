import 'package:easy_localization/easy_localization.dart';
import 'package:caracolibras/app/app_widget_store.dart';
import 'package:caracolibras/app/core/theme/app_theme_dark.dart';
import 'package:caracolibras/app/core/theme/app_theme_light.dart';
import 'package:caracolibras/app/core/utils/remove_scrollglow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  AppWidgetStore appStore = Modular.get<AppWidgetStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor:
            Colors.transparent, // Cor da barra de navegação inferior
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarIconBrightness:
            Brightness.dark, // Ícones escuros na barra de status
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light, // Ícones esc
      ),
    );

    Modular.setNavigatorKey(NavigationService.navigatorKey);
    return Observer(builder: (context) {
      return MaterialApp.router(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        scrollBehavior: BehaviorRemoveScrollGlow(),
        scaffoldMessengerKey: NavigationService.scaffoldMessengerKey,
        title: 'Despesas - Caracol',
        themeMode: appStore.isDark ? ThemeMode.dark : ThemeMode.light,
        theme: AppThemeLight().getTheme(),
        darkTheme: AppThemeDark().getTheme(),
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          ScreenUtil.init(
            context,
            designSize: const Size(411.4, 797.7),
          );
          return Navigator(
            onGenerateRoute: (settings) => MaterialPageRoute(builder: (contex) {
              appStore.setContext(contex);
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child ?? const SizedBox(),
              );
            }),
          );
        },
      );
    });
  }
}

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey();
}
