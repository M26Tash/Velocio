// ignore_for_file: use_if_null_to_convert_nulls_to_bools, comment_references

import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;

  // final String? title;

  /// By default , isLeading is set to [false]
  final bool? isLeading;

  /// To unable [onLeadingPressed], please set [true] to [isLeading]
  final VoidCallback? onLeadingPressed;

  final IconData? icon;

  final bool? centerTitle;

  const CustomAppBar({
    this.title,
    this.isLeading,
    this.icon,
    this.onLeadingPressed,
    this.centerTitle = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: context.theme.transparentColor,
        elevation: AppDimensions.none,
        automaticallyImplyLeading: false,
        leading: isLeading == true
            ? IconButton(
                onPressed: onLeadingPressed,
                icon: Icon(
                  icon ?? Icons.arrow_back_ios_new_rounded,
                  color: context.theme.primaryIconColor,
                ),
              )
            : const SizedBox.shrink(),
        titleSpacing: AppDimensions.none,
        centerTitle: centerTitle,
        title: title,
        // title: title != null
        //     ? Text(
        //         title!,
        //         style: context.themeData.textTheme.headlineMedium?.copyWith(
        //           fontWeight: AppFonts.weightBold,
        //           fontSize: AppFonts.sizeHeadlineMedium,
        //           color: context.theme.primaryTextColor,
        //         ),
        //       )
        //     : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
