import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/common/shared_cubits/app_overlay/app_overlay_cubit.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';

abstract final class SupportMethods {
  static final _overlayCubit = i.get<AppOverlayCubit>();

  static Future<void> showCircularProgress(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: context.theme.mainColor,
        ),
      ),
    );
  }

  static Future<void> showDialog({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    Color barrierColor = kCupertinoModalBarrierColor,
    bool useRootNavigator = false,
    bool userSafeArea = true,
    bool barrierDismissible = true,
  }) async {
    _overlayCubit.applyStyle(
      _overlayCubit.state.style!.copyWith(
        systemNavigationBarColor: context.theme.transparentColor,
      ),
    );

    await showCupertinoDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: builder,
      useRootNavigator: useRootNavigator,
    );

    _overlayCubit.applyPreviousStyle();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  static Future<void> showBottomSheet({
    required BuildContext context,
    required Widget child,
    String? sheetTitle,
    TextStyle? titleStyle,
    bool useRootNavigator = false,
    Color barrierColor = kCupertinoModalBarrierColor,
  }) async {
    await showCupertinoModalPopup(
      context: context,
      useRootNavigator: useRootNavigator,
      barrierColor: barrierColor,
      builder: (_) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          // padding: EdgeInsets.only(
          //   left: AppDimensions.large,
          //   right: AppDimensions.large,
          //   bottom: MediaQuery.of(context).viewInsets.bottom,
          // ),
          child: Material(
            color: context.theme.tertiaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(AppDimensions.large),
            ),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.large),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        if (sheetTitle != null)
                          Text(
                            sheetTitle,
                            style: titleStyle ??
                                context.themeData.textTheme.displaySmall
                                    ?.copyWith(
                                  color: context.theme.primaryTextColor,
                                ),
                          ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.medium),
                    child,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<DateTime?> showDatePicker(
    BuildContext context,
    Future<DateTime?> dateTime,
  ) async {
    _overlayCubit.applyStyle(
      _overlayCubit.state.style!.copyWith(
        systemNavigationBarColor: context.theme.transparentColor,
      ),
    );

    final pickedDate = await dateTime;

    _overlayCubit.applyPreviousStyle();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    return pickedDate;
  }
}
