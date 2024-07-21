import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';

class LanguageOptionTile extends StatelessWidget {
  final String assetPath;
  final String option;
  final Locale value;
  final Locale currentValue;
  final VoidCallback onTap;
  final Widget? widgetAction;
  const LanguageOptionTile({
    required this.assetPath,
    required this.option,
    required this.value,
    required this.currentValue,
    required this.onTap,
    this.widgetAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();

        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.of(context).pop();
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.large,
        ),
        child: Row(
          children: [
            // CustomVector(assetPath: assetPath),
            // const SizedBox(width: AppDimensions.medium),
            Text(
              option,
              style: context.themeData.textTheme.headlineMedium?.copyWith(
                color: context.theme.secondaryTextColor,
                fontWeight: AppFonts.weightRegular,
              ),
            ),
            const Spacer(),
            Radio<Locale>(
              activeColor: context.theme.mainColor,
              fillColor: WidgetStateProperty.resolveWith(
                (states) {
                  if (states.contains(WidgetState.selected)) {
                    return context.theme.mainColor;
                  }
                  return context.theme.primaryIconColor;
                },
              ),
              value: value,
              groupValue: currentValue,
              // ignore: avoid_returning_null_for_void
              onChanged: (value) => null,
            ),
          ],
        ),
      ),
    );
  }
}
