import 'package:animate_do/animate_do.dart';
import 'package:caracolibras/app/app_widget_store.dart';
import 'package:caracolibras/app/core/components/bottom_button.dart';
import 'package:caracolibras/app/core/components/new_textfield.dart';
import 'package:caracolibras/app/core/components/no_result_card.dart';
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
      appBar: AppBar(
          backgroundColor: theme.backgroundColor,
          elevation: 0,
          title: AppText(
              text: 'Módulos',
              color: theme.textColor,
              fontSize: AppFontSize.fz07,
              fontWeight: 'bold')),
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
                    children: [const SizedBox(height: 20), _buildList()],
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
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
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
            return const NoResultCard(
                message: '*:(*\nNenhum módulo\nencontrado');
          }

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: store.modulesLbr
                  .map(
                    (module) => InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: () {
                        Modular.to.pushNamed('/view', arguments: module);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.fillColor,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: theme.borderColor!, width: 1.5),
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(
                                        int.parse(module.category!['color'])),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: AppConst.sidePadding),
                                  margin: EdgeInsets.symmetric(
                                      vertical: AppConst.sidePadding,
                                      horizontal: AppConst.sidePadding),
                                  child: AppText(
                                      text: '${module.category!['name']}',
                                      color: theme.textColor,
                                      fontWeight: 'bold',
                                      fontSize: AppFontSize.fz05),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: theme.borderColor!,
                                            width: 2),
                                        bottom: BorderSide(
                                            color: theme.borderColor!,
                                            width: 2),
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                      )),
                                  padding: EdgeInsets.only(
                                      top: 8,
                                      bottom: 8,
                                      right: AppConst.sidePadding,
                                      left: AppConst.sidePadding),
                                  child: Column(
                                    children: [
                                      //month
                                      AppText(
                                          text: DateFormat('MMM')
                                              .format(module.date!)
                                              .toUpperCase(),
                                          color: theme.textColor,
                                          fontWeight: 'medium',
                                          fontSize: AppFontSize.fz02),
                                      //day
                                      AppText(
                                          text: DateFormat('dd')
                                              .format(module.date!),
                                          color: theme.textColor,
                                          fontWeight: 'bold',
                                          fontSize: AppFontSize.fz06),
                                      //year
                                      AppText(
                                          text: DateFormat('yyyy')
                                              .format(module.date!),
                                          color: theme.textColor,
                                          fontWeight: 'medium',
                                          fontSize: AppFontSize.fz02),
                                    ],
                                  ),
                                ),
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
                            if (module.tags!.isNotEmpty)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: AppConst.sidePadding,
                                    horizontal: AppConst.sidePadding),
                                child: AppText(
                                    text: '${module.tags!.join(', ')}',
                                    color: theme.textColor,
                                    fontSize: AppFontSize.fz06),
                              ),
                            if (module.tags!.isEmpty)
                              const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList());
        }));
  }
}
