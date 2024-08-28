import 'package:caracolibras/app/core/constants/colors.dart';
import 'package:caracolibras/app/core/constants/fonts_sizes.dart';
import 'package:caracolibras/app/core/constants/colors.dart';
import 'package:caracolibras/app/core/constants/fonts_sizes.dart';
import 'package:caracolibras/app/core/theme/them_custom.dart';
import 'package:caracolibras/app/core/utils/text_styles.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontWeight;
  final Color? color;
  final double? letterSpacing;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? height;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;
  final Color? decorationColor;
  final double? decorationThickness;
  final bool? replaceAsterisks;
  const AppText({
    super.key,
    required this.text,
    this.fontSize = AppFontSize.fontSize5,
    this.fontWeight = "regular",
    this.color,
    this.letterSpacing,
    this.textAlign,
    this.height,
    this.maxLines,
    this.decoration,
    this.fontStyle,
    this.decorationColor,
    this.decorationThickness,
    this.replaceAsterisks,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeCustom theme = Theme.of(context).extension<ThemeCustom>()!;
    return Container(
      color: Colors.transparent,
      child: EasyRichText(
        text,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines ?? null, // Permitir quebra de linha
        overflow:
            TextOverflow.visible, // Permitir que o texto ocupe várias linhas
        defaultStyle: textStyle(
            color: color ?? theme.textColor,
            overflow: TextOverflow
                .visible, // Permitir que o texto ocupe várias linhas
            fontSize: fontSize,
            fontStyle: fontStyle,
            height: height,
            fontWeight: fontWeight,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationThickness: decorationThickness,
            letterSpacing: letterSpacing),
        patternList: [
          EasyRichTextPattern(
            targetString: '(\\*)(.*?)(\\*)',
            matchBuilder: (BuildContext? context, RegExpMatch? match) {
              return TextSpan(
                text: (replaceAsterisks ?? true)
                    ? match![0]!.replaceAll('*', '')
                    : match![0]!,
                style: textStyle(
                    color: color,
                    height: height,
                    fontSize: fontSize,
                    overflow: TextOverflow
                        .visible, // Permitir que o texto ocupe várias linhas
                    fontWeight: "bold",
                    decoration: decoration,
                    letterSpacing: letterSpacing),
              );
            },
          ),
        ],
      ),
    );
  }
}
