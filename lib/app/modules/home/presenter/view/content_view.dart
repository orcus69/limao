import 'package:caracolibras/app/app_widget_store.dart';
import 'package:caracolibras/app/core/components/image_asset.dart';
import 'package:caracolibras/app/core/components/svg_asset.dart';
import 'package:caracolibras/app/core/components/text.dart';
import 'package:caracolibras/app/core/components/video_asset.dart';
import 'package:caracolibras/app/core/constants/colors.dart';
import 'package:caracolibras/app/core/constants/const.dart';
import 'package:caracolibras/app/core/constants/fonts_sizes.dart';
import 'package:caracolibras/app/core/store/auth/auth_store.dart';
import 'package:caracolibras/app/core/theme/them_custom.dart';
import 'package:caracolibras/app/modules/home/external/model/content_module_model.dart';
import 'package:caracolibras/app/modules/home/presenter/home_store.dart';
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
  bool backToTop = false;
  @override
  void initState() {
    super.initState();

    authStore = Modular.get<AppWidgetStore>();
    store = Modular.get<HomeStore>();
    controller = Modular.get<AuthStore>();
    theme = Theme.of(authStore.appContext!).extension<ThemeCustom>()!;

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      store.scrollController.addListener(() {
        if (store.scrollController.position.pixels >= 681 && !backToTop) {
          setState(() {
            backToTop = true;
          });
        } else if (store.scrollController.position.pixels <= 681 && backToTop) {
          setState(() {
            backToTop = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //List of content
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
          backgroundColor: theme.backgroundColor,
          elevation: 0,
          centerTitle: false,
          leading: InkWell(
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
          title: AppText(
              text: widget.content.title!,
              color: theme.textColor,
              fontSize: AppFontSize.fz07,
              maxLines: 2,
              fontWeight: 'bold')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Builder(builder: (context) {
            if (backToTop) {
              return InkWell(
                onTap: () {
                  store.jumpToPreviousContent();
                },
                child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: theme.fillColor,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: AppSvgAsset(
                        image: 'left.svg',
                        color: theme.textColor,
                      ),
                    )),
              );
            }
            return Container(
              width: 60,
            );
          }),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              store.jumpToNextContent();
            },
            child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: theme.fillColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(20),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: AppSvgAsset(
                    image: 'left.svg',
                    color: theme.textColor,
                  ),
                )),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: store.scrollController,
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [_buildContentList()],
          ),
        ),
      ),
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
              // const SizedBox(height: 10),
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
            AppVideoAsset(
              videoPath: content.src!,
              videoH: 250,
            ),
          if (content.type == 'image')
            AppImageAsset(image: content.src!, imageH: 250),
          if (content.type == 'gif')
            Image.asset(
              content.src!,
              height: 250,
            ),

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
