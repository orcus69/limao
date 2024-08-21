import 'package:animate_do/animate_do.dart';
import 'package:caracolibras/app/app_widget_store.dart';
import 'package:caracolibras/app/core/components/bottom_button.dart';
import 'package:caracolibras/app/core/components/new_textfield.dart';
import 'package:caracolibras/app/core/components/svg_asset.dart';
import 'package:caracolibras/app/core/components/text.dart';
import 'package:caracolibras/app/core/constants/colors.dart';
import 'package:caracolibras/app/core/constants/const.dart';
import 'package:caracolibras/app/core/constants/fonts_sizes.dart';
import 'package:caracolibras/app/core/localization/app_language_store.dart';
import 'package:caracolibras/app/core/store/auth/auth_store.dart';
import 'package:caracolibras/app/core/theme/them_custom.dart';
import 'package:caracolibras/app/modules/home/external/model/module_model.dart';
import 'package:caracolibras/app/modules/home/presenter/home_store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final HomeStore store;
  late AppWidgetStore authStore;
  late AuthStore controller;
  late ThemeCustom theme;

  @override
  void initState() {
    super.initState();

    authStore = Modular.get<AppWidgetStore>();
    store = Modular.get<HomeStore>();
    controller = Modular.get<AuthStore>();
    theme = Theme.of(authStore.appContext!).extension<ThemeCustom>()!;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.loadDatabase();
      await store.getModules();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      floatingActionButton: Observer(
        builder: (context) {
          return Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: theme.fillColor,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(20),
              child: Observer(builder: (context) {
                return AppSvgAsset(
                  image: 'add.svg',
                  color: theme.textColor,
                );
              }));
        },
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (_, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 20),
                      _buildList()
                    ],
                  ),
                ),
              ),
              //Footer
              // if (!isMobile) _buildFooter(),
              const SizedBox(height: 20),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          child: Container(
            padding: EdgeInsets.all(AppConst.sidePadding),
            child: AppSvgAsset(
              image: 'left.svg',
              color: theme.textColor,
              imageH: 18,
            ),
          ),
        ),
        AppText(
            text: 'Módulos',
            color: theme.textColor,
            fontSize: AppFontSize.fz07,
            fontWeight: 'bold'),
      ],
    );
  }

  Widget _buildList() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: AppConst.sidePadding),
        child: Observer(builder: (context) {
          // if (store.loading) {
          //   return Center(
          //     child: CircularProgressIndicator(
          //       color: theme.textColor,
          //     ),
          //   );
          // }
          if (store.modulesLbr.isEmpty) {
            return Center(
              child: AppText(
                text: 'Nenhuma módulo encontrado',
                color: theme.textColor,
                fontSize: AppFontSize.fz06,
              ),
            );
          }

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: store.modulesLbr
                  .map(
                    (module) => InkWell(
                      onTap: () {
                        Modular.to.pushNamed('/view', arguments: module);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.fillColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(
                                        int.parse(module.category!['color'])),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.symmetric(
                                      vertical: AppConst.sidePadding,
                                      horizontal: AppConst.sidePadding),
                                  child: AppText(
                                      text: '${module.category!['name']}',
                                      color: theme.textColor,
                                      fontSize: AppFontSize.fz05),
                                ),
                                AppText(
                                    text: '${module.date}',
                                    color: theme.textColor,
                                    fontSize: AppFontSize.fz05),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppConst.sidePadding),
                              child: AppText(
                                  text: '${module.title}',
                                  color: theme.textColor,
                                  fontSize: AppFontSize.fz06),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: AppConst.sidePadding,
                                  horizontal: AppConst.sidePadding),
                              child: AppText(
                                  text: '${module.tags!.join(', ')}',
                                  color: theme.textColor,
                                  fontSize: AppFontSize.fz06),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList());
        }));
  }
}
