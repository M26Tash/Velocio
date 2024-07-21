import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/widgets/custom_vector/custom_vector.dart';

class CustomVectorButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? assetColor;
  final ShapeBorder? buttonShape;
  final bool? disableSplash;
  final bool isSmall;
  const CustomVectorButton({
    required this.assetPath,
    required this.onPressed,
    this.buttonColor,
    this.assetColor,
    this.buttonShape = const CircleBorder(),
    this.disableSplash = false,
    this.isSmall = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: isSmall,
      splashColor:
          disableSplash == false ? null : context.theme.transparentColor,
      hoverColor:
          disableSplash == false ? null : context.theme.transparentColor,
      focusColor:
          disableSplash == false ? null : context.theme.transparentColor,
      backgroundColor: buttonColor ?? context.theme.transparentColor,
      shape: buttonShape,
      elevation: 0,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.small),
        child: CustomVector(
          assetPath: assetPath,
          color: assetColor ?? context.theme.quaternaryColor,
        ),
      ),
    );
  }
}
