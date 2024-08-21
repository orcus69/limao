import 'package:caracolibras/app/app_widget_store.dart';
import 'package:caracolibras/app/core/components/svg_asset.dart';
import 'package:caracolibras/app/core/components/text.dart';
import 'package:caracolibras/app/core/constants/const.dart';
import 'package:caracolibras/app/core/constants/fonts_sizes.dart';
import 'package:caracolibras/app/core/store/auth/auth_store.dart';
import 'package:caracolibras/app/core/theme/them_custom.dart';
import 'package:caracolibras/app/modules/home/external/model/module_model.dart';
import 'package:caracolibras/app/modules/home/presenter/home_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModuleView extends StatefulWidget {
  final ModuleModel module;
  const ModuleView({super.key, required this.module});

  @override
  State<ModuleView> createState() => _ModuleViewState();
}

class _ModuleViewState extends State<ModuleView> {
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
      //TODO: Buscar conteúdo do módulo pelo id
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
          onTap: () {
            Modular.to.pop();
          },
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
            text: widget.module.title!,
            color: theme.textColor,
            fontSize: AppFontSize.fz07,
            fontWeight: 'bold'),
      ],
    );
  }
}
