import 'package:caracolibras/app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 0,
      height: 0,
      endIndent: 0,
      color: AppColors.grey.withOpacity(0.1),
      thickness: 1.1,
    );
  }
}
