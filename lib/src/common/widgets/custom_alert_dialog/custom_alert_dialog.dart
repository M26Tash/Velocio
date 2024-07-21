import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';

class CustomAlertDialog extends StatelessWidget {
  final String? title;
  final TextStyle? titleTextStyle;
  final VoidCallback? okayCallback;
  final Widget? widget;
  final List<Widget>? actions;
  final bool withCancel;
  final bool shouldCloseOnOkTap;

  const CustomAlertDialog({
    this.title,
    this.titleTextStyle,
    this.okayCallback,
    this.widget,
    this.actions,
    this.withCancel = true,
    this.shouldCloseOnOkTap = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.themeData.copyWith(
        colorScheme: context.theme.isDark == true
            ? ColorScheme.dark(
                primary: context.theme.secondaryColor,
              )
            : ColorScheme.light(
                primary: context.theme.secondaryColor,
              ),
      ),
      child: CupertinoAlertDialog(
        title: title != null
            ? Text(
                title!,
                style: titleTextStyle ??
                    context.themeData.textTheme.headlineMedium?.copyWith(
                      fontWeight: AppFonts.weightRegular,
                    ),
              )
            : null,
        content: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppDimensions.large,
            ),
          ),
          child: Material(
            color: context.theme.secondaryColor,
            child: widget,
          ),
        ),
        actions: actions ??
            [
              if (withCancel)
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Navigator.of(context).pop(),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppDimensions.medium,
                      ),
                      child: Text(
                        'Cancel',
                        // context.locale.,
                        style:
                            context.themeData.textTheme.headlineSmall?.copyWith(
                          color: context.theme.mainColor,
                        ),
                      ),
                    ),
                  ),
                ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (shouldCloseOnOkTap) Navigator.pop(context);
                  okayCallback?.call();
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.medium,
                    ),
                    child: Text(
                      'OK',
                      // context.locale.ok,
                      style:
                          context.themeData.textTheme.headlineSmall?.copyWith(
                        color: context.theme.mainColor,
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
