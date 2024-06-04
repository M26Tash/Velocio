// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  final Color? backgroundColor;
  final BoxDecoration? boxDecoration;
  final TextStyle? textStyle;
  final List<BoxShadow>? boxShadow;
  const CustomButton({
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.boxDecoration,
    this.textStyle,
    this.boxShadow,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(AppDimensions.large),
              decoration: boxDecoration ??
                  BoxDecoration(
                    color: backgroundColor ?? context.theme.mainColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        AppDimensions.large,
                      ),
                    ),
                    boxShadow: boxShadow,
                  ),
              child: Center(
                child: Text(
                  text,
                  style: textStyle ??
                      context.themeData.textTheme.headlineMedium?.copyWith(
                        fontWeight: AppFonts.weightMedium,
                        color: context.theme.whiteTextColor,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
