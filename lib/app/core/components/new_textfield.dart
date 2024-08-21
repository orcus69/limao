import 'package:caracolibras/app/app_widget_store.dart';
import 'package:caracolibras/app/core/constants/colors.dart';
import 'package:caracolibras/app/core/constants/fonts_sizes.dart';
import 'package:caracolibras/app/core/theme/them_custom.dart';
import 'package:caracolibras/app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewTextfield extends StatefulWidget {
  final Widget? select;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final String? hintText;
  final String? initialValue;
  final String? prefixText;
  final String? suffixText;
  final bool? isValid;
  final bool? obscureText;
  final bool? autofocus;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  const NewTextfield(
      {super.key,
      this.select,
      this.controller,
      this.inputFormatters,
      this.textInputType,
      this.initialValue,
      this.hintText,
      this.prefixText,
      this.suffixText,
      this.isValid = true,
      this.obscureText,
      this.autofocus,
      this.focusNode,
      this.onChanged});

  @override
  State<NewTextfield> createState() => _NewTextfieldState();
}

class _NewTextfieldState extends State<NewTextfield> {
  late AppWidgetStore authStore;

  @override
  void initState() {
    super.initState();

    authStore = Modular.get<AppWidgetStore>();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).extension<ThemeCustom>()!;
    return Container(
      decoration: BoxDecoration(
        color: authStore.isDark ? theme.fillColor : theme.backgroundColor,
        border: Border.all(
            color: authStore.isDark ? theme.fillColor! : theme.borderColor!,
            width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      // padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.select != null) widget.select!,
          Expanded(
            child: TextFormField(
              initialValue: widget.initialValue,
              onChanged: widget.onChanged,
              focusNode: widget.focusNode,
              autofocus: widget.autofocus ?? false,
              controller: widget.controller,
              cursorColor: AppColors.black,
              textAlign:
                  widget.select != null ? TextAlign.end : TextAlign.start,
              style: TextStyle(
                fontFamily: 'bold',
                fontSize: AppFontSize.fz06,
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
        ],
      ),
    );
  }
}
