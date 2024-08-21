import 'package:caracolibras/app/core/components/svg_asset.dart';
import 'package:caracolibras/app/core/components/text.dart';
import 'package:caracolibras/app/core/constants/colors.dart';
import 'package:caracolibras/app/core/constants/fonts_sizes.dart';
import 'package:caracolibras/app/core/utils/screen_helper.dart';
import 'package:flutter/material.dart';

class CustomNotification extends StatefulWidget {
  final String message;
  final Color? primaryColor;
  final String? icon;
  final VoidCallback onClose;

  const CustomNotification({
    super.key,
    required this.message,
    required this.onClose,
    this.primaryColor,
    this.icon,
  });

  @override
  _CustomNotificationState createState() => _CustomNotificationState();
}

class _CustomNotificationState extends State<CustomNotification>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reverse();
        widget.onClose();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Positioned(
          top: MediaQuery.of(context).size.height * 0.04,
          left: 0,
          right: 0,
          child: Material(
            color: Colors.transparent,
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SizedBox(
                  height: 80.0,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    padding: const EdgeInsets.only(
                        bottom: 20, top: 20, left: 20, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(stops: const [
                          0.015,
                          0.015
                        ], colors: [
                          widget.primaryColor ?? const Color(0xFFec4444),
                          AppColors.white
                        ]),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.09),
                            offset: const Offset(0, 8),
                            blurRadius: 8,
                            spreadRadius: -5,
                          ),
                        ]),
                    child: Row(
                      children: [
                        AppSvgAsset(
                          imageW: 20,
                          imageH: 20,
                          image: widget.icon ?? 'warning.svg',
                          color: widget.primaryColor ?? const Color(0xFFec4444),
                        ),
                        SizedBox(width: ScreenHelper.doubleWidth(20)),
                        Expanded(
                          child: AppText(
                            text: widget.message,
                            fontSize: AppFontSize.fontSize4,
                            maxLines: 4,
                          ),
                        ),
                        SizedBox(width: ScreenHelper.doubleWidth(20)),
                        InkWell(
                          onTap: () {
                            _animationController.reverse();
                            widget.onClose();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: AppSvgAsset(
                              image: 'close.svg',
                              imageH: 15,
                              imageW: 15,
                              color: AppColors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class NotificationService {
  static OverlayEntry? overlayEntry;

  static void showNotification(
      BuildContext context, String message, String? icon, Color? color) {
    overlayEntry = OverlayEntry(
      builder: (context) => CustomNotification(
        icon: icon,
        primaryColor: color,
        message: message,
        onClose: () {
          overlayEntry!.remove();
        },
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }
}
