import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/widgets/custom_vector/custom_vector.dart';

class OptionTile extends StatelessWidget {
  final String assetPath;
  final String option;
  final Widget? widgetAction;
  final VoidCallback? onTap;
  const OptionTile({
    required this.assetPath,
    required this.option,
    this.widgetAction,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.large,
        ),
        child: Row(
          children: [
            CustomVector(assetPath: assetPath),
            const SizedBox(width: AppDimensions.medium),
            Text(
              option,
              style: context.themeData.textTheme.headlineMedium?.copyWith(
                color: context.theme.secondaryTextColor,
                fontWeight: AppFonts.weightRegular,
              ),
            ),
            const Spacer(),
            widgetAction ??
                const CustomVector(
                  assetPath: AppAssets.arrowRightIcon,
                ),
          ],
        ),
      ),
    );
  }
}
