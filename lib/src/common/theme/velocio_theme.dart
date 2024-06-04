import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class VelocioTheme extends Equatable {
  final bool isDark;

  final Color backgroundColor;
  final Color mainColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color quaternaryColor;
  final Color fiveFoldColor;

  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color tertiaryTextColor;
  final Color quaternaryTextColor;
  final Color whiteTextColor;

  final Color primaryIconColor;
  final Color secondaryIconColor;

  final Color inputFieldFillColor;

  final Color errorColor;

  final Color transparentColor;

  final Brightness statusBarBrightness;
  final Brightness navigationBarBrightness;

  final String fontFamily;

  @override
  List<Object?> get props => [
    isDark,
    backgroundColor,
    mainColor,
    secondaryColor,
    tertiaryColor,
    quaternaryColor,
    fiveFoldColor,
    primaryTextColor,
    secondaryTextColor,
    tertiaryTextColor,
    quaternaryTextColor,
    whiteTextColor,
    primaryIconColor,
    secondaryIconColor,
    inputFieldFillColor,
    errorColor,
    transparentColor,
    statusBarBrightness,
    navigationBarBrightness,
    fontFamily,
  ];

  const VelocioTheme({
    required this.isDark,
    required this.backgroundColor,
    required this.mainColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.quaternaryColor,
    required this.fiveFoldColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.tertiaryTextColor,
    required this.quaternaryTextColor,
    required this.whiteTextColor,
    required this.primaryIconColor,
    required this.secondaryIconColor,
    required this.inputFieldFillColor,
    required this.errorColor,
    required this.transparentColor,
    required this.statusBarBrightness,
    required this.navigationBarBrightness,
    required this.fontFamily,
  });
}
