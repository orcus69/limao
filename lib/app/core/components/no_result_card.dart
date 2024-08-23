import 'package:caracolibras/app/app_widget_store.dart';
import 'package:caracolibras/app/core/components/svg_asset.dart';
import 'package:caracolibras/app/core/components/text.dart';
import 'package:caracolibras/app/core/constants/const.dart';
import 'package:caracolibras/app/core/constants/fonts_sizes.dart';
import 'package:caracolibras/app/core/theme/them_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NoResultCard extends StatelessWidget {
  final String message;
  const NoResultCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
   final AppWidgetStore authStore = Modular.get<AppWidgetStore>();
  final ThemeCustom theme = Theme.of(authStore.appContext!).extension<ThemeCustom>()!;
    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 200,
              padding: EdgeInsets.all(AppConst.sidePadding),
              decoration: BoxDecoration(
                color: theme.fillColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  AppSvgAsset(
                      image: 'globe.svg', imageH: 30, color: theme.textColor),
                  const SizedBox(height: 10),
                  AppText(
                      text: message,
                      textAlign: TextAlign.center,
                      color: theme.textColor,
                      // fontWeight: 'bold',
                      fontSize: AppFontSize.fz06),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
