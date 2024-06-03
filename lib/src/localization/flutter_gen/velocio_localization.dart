// ignore_for_file: depend_on_referenced_packages, lines_longer_than_80_chars

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'package:velocio/src/localization/flutter_gen/velocio_localization_en.dart';
import 'package:velocio/src/localization/flutter_gen/velocio_localization_it.dart';
import 'package:velocio/src/localization/flutter_gen/velocio_localization_ru.dart';
import 'package:velocio/src/localization/flutter_gen/velocio_localization_tr.dart';

/// Callers can lookup localized strings with an instance of VelocioLocalization
/// returned by `VelocioLocalization.of(context)`.
///
/// Applications need to include `VelocioLocalization.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'flutter_gen/velocio_localization.dart';
///
/// return MaterialApp(
///   localizationsDelegates: VelocioLocalization.localizationsDelegates,
///   supportedLocales: VelocioLocalization.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the VelocioLocalization.supportedLocales
/// property.
abstract class VelocioLocalization {
  VelocioLocalization(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale);

  final String localeName;

  static VelocioLocalization of(BuildContext context) {
    return Localizations.of<VelocioLocalization>(context, VelocioLocalization)!;
  }

  static const LocalizationsDelegate<VelocioLocalization> delegate =
      _VelocioLocalizationDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('it'),
    Locale('ru'),
    Locale('tr'),
  ];

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'hello'**
  String get hello;
}

class _VelocioLocalizationDelegate
    extends LocalizationsDelegate<VelocioLocalization> {
  const _VelocioLocalizationDelegate();

  @override
  Future<VelocioLocalization> load(Locale locale) {
    return SynchronousFuture<VelocioLocalization>(
      lookupVelocioLocalization(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'it', 'ru', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_VelocioLocalizationDelegate old) => false;
}

VelocioLocalization lookupVelocioLocalization(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return VelocioLocalizationEn();
    case 'it':
      return VelocioLocalizationIt();
    case 'ru':
      return VelocioLocalizationRu();
    case 'tr':
      return VelocioLocalizationTr();

    default:
      return VelocioLocalizationEn();
  }
}
