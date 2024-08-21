import 'package:flutter_modular/flutter_modular.dart';
import 'package:caracolibras/app/app_widget_store.dart';
import 'package:caracolibras/app/core/components/svg_asset.dart';
import 'package:caracolibras/app/core/components/text.dart';
import 'package:caracolibras/app/core/constants/colors.dart';
import 'package:caracolibras/app/core/constants/fonts_sizes.dart';
import 'package:caracolibras/app/core/theme/them_custom.dart';
import 'package:caracolibras/app/core/utils/screen_helper.dart';
import 'package:caracolibras/app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RectangularTextField extends StatefulWidget {
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final String? hintText;
  final String? errorText;
  final String? initialValue;
  final String prefix;
  final String? prefixText;
  final String? suffixText;
  final bool? isValid;
  final bool? obscureText;
  final bool? autofocus;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  const RectangularTextField(
      {super.key,
      this.controller,
      this.inputFormatters,
      this.textInputType,
      this.initialValue,
      this.hintText,
      this.errorText,
      required this.prefix,
      this.prefixText,
      this.suffixText,
      this.isValid = true,
      this.obscureText,
      this.autofocus,
      this.focusNode,
      this.onChanged});

  @override
  State<RectangularTextField> createState() => _RectangularTextFieldState();
}

class _RectangularTextFieldState extends State<RectangularTextField> {
  late AppWidgetStore authStore;

  @override
  void initState() {
    super.initState();

    authStore = Modular.get<AppWidgetStore>();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).extension<ThemeCustom>()!;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: authStore.isDark ? theme.fillColor : theme.backgroundColor,
            border: Border.all(
                color: authStore.isDark ? theme.fillColor! : theme.borderColor!,
                width: 1.0),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 80,
                child: AppText(
                  text: widget.prefix,
                  fontSize: AppFontSize.fz04,
                  height: 2,
                  textAlign: TextAlign.start,
                ),
              ),
              // SizedBox(width: ScreenHelper.doubleWidth(10.0)),
              Expanded(
                child: TextFormField(
                  initialValue: widget.initialValue,
                  onChanged: widget.onChanged,
                  focusNode: widget.focusNode,
                  autofocus: widget.autofocus ?? false,
                  obscureText: widget.obscureText ?? false,
                  controller: widget.controller,
                  cursorColor: AppColors.black,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'bold',
                    fontSize: AppFontSize.fz07,
                    color: theme.textColor,
                    letterSpacing: -0.5,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16.0),
                    errorMaxLines: 2,
                    hintStyle: const TextStyle(
                      fontFamily: 'regular',
                      fontSize: AppFontSize.fz07,
                      color: AppColors.grey,
                    ),
                    errorStyle: textStyle(
                      fontFamilyFallback: ['regular'],
                      color: AppColors.red,
                      fontSize: AppFontSize.fz05,
                    ),
                    suffixText: widget.suffixText,
                    suffixStyle: textStyle(
                      fontWeight: 'bold',
                      color: AppColors.black,
                      fontSize: AppFontSize.fz07,
                    ),
                    prefixText: widget.prefixText,
                    prefixStyle: textStyle(
                      fontWeight: 'bold',
                      color: AppColors.black,
                      fontSize: AppFontSize.fz07,
                    ),
                    suffixIconConstraints:
                        const BoxConstraints(maxWidth: 18, maxHeight: 18),
                    border: InputBorder.none,
                    hintText: widget.hintText ?? '',
                  ),
                  keyboardType: widget.textInputType,
                  inputFormatters: widget.inputFormatters,
                ),
              ),
              if (widget.errorText != null)
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: AppSvgAsset(
                    image: 'exclamation.svg',
                    color: AppColors.red,
                  ),
                ),
              if (widget.errorText != null)
                SizedBox(width: ScreenHelper.doubleWidth(20.0)),
            ],
          ),
        ),
        if (widget.errorText != null)
          SizedBox(height: ScreenHelper.doubleHeight(14.0)),
        if (widget.errorText != null)
          Row(
            children: [
              AppText(
                  text: widget.errorText!,
                  fontSize: AppFontSize.fz05,
                  color: AppColors.red,
                  fontWeight: 'bold')
            ],
          )
      ],
    );
  }
}
