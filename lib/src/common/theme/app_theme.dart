import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocio/src/common/theme/velocio_theme.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/utils/constants/fonts_assets.dart';

const _white = Color(0xFFFFFFFF);
const _whiteSmoke = Color(0xFFF5F5F5);
const _greenWhite = Color(0xFFE9E9E9);
const _darkJungleGreen = Color(0xFF1E1E1E);
const _cornflower = Color(0xFF547AFF);
const _mistBlue = Color(0xFF637381);
const _bluishGrey = Color(0xFF7C8BA0);
const _balticSea = Color(0xFF212327);
const _heavyMetal = Color(0xFF27292E);
const _charcoal = Color(0xFF323438);
const _languidLavendar = Color(0xFFCCCDD7);
const _coralRed = Color(0xFFFF3D3D);


const _transparent = Color(0x00000000);

const lightTheme = VelocioTheme(
  isDark: false,
  backgroundColor: _white,
  mainColor: _cornflower,
  secondaryColor: _whiteSmoke,
  tertiaryColor: _greenWhite,
  quaternaryColor: _darkJungleGreen,
  fiveFoldColor: _darkJungleGreen,
  primaryTextColor: _darkJungleGreen,
  secondaryTextColor: _mistBlue,
  tertiaryTextColor: _bluishGrey,
  quaternaryTextColor: _cornflower,
  whiteTextColor: _white,
  primaryIconColor: _darkJungleGreen,
  secondaryIconColor: _bluishGrey,
  inputFieldFillColor: _whiteSmoke,
  errorColor: _coralRed,
  transparentColor: _transparent,
  statusBarBrightness: Brightness.light,
  navigationBarBrightness: Brightness.dark,
  fontFamily: FontsAssets.poppinsFamily,
);

const darkTheme = VelocioTheme(
  isDark: true,
  backgroundColor: _balticSea,
  mainColor: _cornflower,
  secondaryColor: _heavyMetal,
  tertiaryColor: _charcoal,
  quaternaryColor: _white,
  fiveFoldColor: _white,
  primaryTextColor: _white,
  secondaryTextColor: _languidLavendar,
  tertiaryTextColor: _bluishGrey,
  quaternaryTextColor: _cornflower,
  whiteTextColor: _white,
  primaryIconColor: _white,
  secondaryIconColor: _bluishGrey,
  inputFieldFillColor: _heavyMetal,
  errorColor: _coralRed,
  transparentColor: _transparent,
  statusBarBrightness: Brightness.dark,
  navigationBarBrightness: Brightness.dark,
  fontFamily: FontsAssets.poppinsFamily,
);


ThemeData generateThemeData(VelocioTheme theme){
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: theme.fontFamily,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: theme.mainColor,
      selectionHandleColor: theme.mainColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeDisplayLarge,
      ),
      displayMedium: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeDisplayMedium,
      ),
      displaySmall: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeDisplaySmall,
      ),
      headlineLarge: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeDisplayMedium,
        letterSpacing: AppFonts.letterSpacing,
      ),
      headlineMedium: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeHeadlineMedium,
        letterSpacing: AppFonts.letterSpacing,
      ),
      headlineSmall: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeHeadlineSmall,
        letterSpacing: AppFonts.letterSpacing,
      ),
      titleLarge: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeHeadlineSmall,
        letterSpacing: AppFonts.letterSpacing,
      ),
      titleMedium: TextStyle(
        fontWeight: AppFonts.weightBold,
        fontSize: AppFonts.sizeTitleMedium,
      ),
      titleSmall: TextStyle(
        fontWeight: AppFonts.weightRegular,
        fontSize: AppFonts.sizeTitleMedium,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: theme.transparentColor,
        statusBarIconBrightness: theme.statusBarBrightness,
        systemNavigationBarColor: theme.transparentColor,
        systemNavigationBarIconBrightness: theme.navigationBarBrightness,
      ),
    ),
  );
}
