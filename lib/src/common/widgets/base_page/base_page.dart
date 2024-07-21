import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/widgets/custom_app_bar/custom_app_bar.dart';

class BasePage extends StatelessWidget {
  final Color? backgroundColor;
  final CustomAppBar? appBar;
  final Widget? body;
  final bool? resizeToAvoidBottomInset;
  const BasePage({
    this.backgroundColor,
    this.appBar,
    this.body,
    this.resizeToAvoidBottomInset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor ?? context.theme.backgroundColor,
      appBar: appBar,
      body: body,
    );
  }
}
