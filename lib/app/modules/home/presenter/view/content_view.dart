import 'package:caracolibras/app/app_widget_store.dart';
import 'package:caracolibras/app/core/components/svg_asset.dart';
import 'package:caracolibras/app/core/components/text.dart';
import 'package:caracolibras/app/core/constants/colors.dart';
import 'package:caracolibras/app/core/constants/const.dart';
import 'package:caracolibras/app/core/constants/fonts_sizes.dart';
import 'package:caracolibras/app/core/store/auth/auth_store.dart';
import 'package:caracolibras/app/core/theme/them_custom.dart';
import 'package:caracolibras/app/modules/home/external/model/content_module_model.dart';
import 'package:caracolibras/app/modules/home/external/model/module_model.dart';
import 'package:caracolibras/app/modules/home/presenter/home_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentView extends StatefulWidget {
  final ContentModuleModel content;
  const ContentView({super.key, required this.content});

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
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
  }

  @override
  Widget build(BuildContext context) {
    //List of content
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [_buildHeader(), _buildContentList()],
          ),
        ),
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
            text: widget.content.title!,
            color: theme.textColor,
            fontSize: AppFontSize.fz07,
            maxLines: 2,
            fontWeight: 'bold'),
      ],
    );
  }

  Widget _buildContentList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConst.sidePadding),
      child: Column(
        children: widget.content.content!.map((e) {
          return Column(
            children: [
              _buildContentItem(e),
              const SizedBox(height: 20),
            ],
          );
        }).toList(),
      ),
    );
  }

  _buildContentItem(ContentListModel content) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Video or image
          if (content.type == 'video')
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.grey,
              ),
            ),
          if (content.type == 'image') Image.network(content.src!),

          const SizedBox(height: 20),
          AppText(
            text: content.title!,
            fontSize: AppFontSize.fz08,
            fontWeight: 'bold',
          ),
          const SizedBox(height: 10),
          AppText(
            text: content.description!,
            fontSize: AppFontSize.fz06,
          ),
        ],
      ),
    );
  }
}
