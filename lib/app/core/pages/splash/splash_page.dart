import 'package:caracolibras/app/core/components/image_asset.dart';
import 'package:caracolibras/app/core/components/text.dart';
import 'package:caracolibras/app/core/constants/fonts_sizes.dart';
import 'package:caracolibras/app/core/store/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:caracolibras/app/core/components/svg_asset.dart';
import 'package:caracolibras/app/core/constants/colors.dart';
import 'package:caracolibras/app/core/utils/screen_helper.dart';
import 'package:animate_do/animate_do.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AuthStore controller;
  @override
  void initState() {
    super.initState();
    controller = Modular.get<AuthStore>();
    controller.loadDatabase().then(
          (value) => controller.checkOnboard(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: ScreenHelper.height,
          child: Stack(
            children: [
              Container(
                width: ScreenHelper.width,
                height: ScreenHelper.height,
                color: AppColors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: ZoomIn(
                      duration: const Duration(milliseconds: 300),
                      delay: const Duration(milliseconds: 500),
                      child: const SizedBox(
                        height: 100,
                        width: 100,
                        child: AppImageAsset(
                          image: 'stackfy-logo.png',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ZoomIn(
                    child: AppText(
                        text: 'Stackfy',
                        fontSize: AppFontSize.fz07,
                        fontWeight: 'bold'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
