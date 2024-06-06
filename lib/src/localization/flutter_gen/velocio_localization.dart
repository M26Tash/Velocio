import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'velocio_localization_en.dart';
import 'velocio_localization_it.dart';
import 'velocio_localization_ru.dart';
import 'velocio_localization_tr.dart';

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
  VelocioLocalization(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static VelocioLocalization of(BuildContext context) {
    return Localizations.of<VelocioLocalization>(context, VelocioLocalization)!;
  }

  static const LocalizationsDelegate<VelocioLocalization> delegate = _VelocioLocalizationDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
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
    Locale('tr')
  ];

  /// No description provided for @loginYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Login Your Account'**
  String get loginYourAccount;

  /// No description provided for @phoneNumberOrEmail.
  ///
  /// In en, this message translates to:
  /// **'Phone Number / Email'**
  String get phoneNumberOrEmail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password ?'**
  String get forgotPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have account?'**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @doYouHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Do you have account?'**
  String get doYouHaveAccount;

  /// No description provided for @enterOtp.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get enterOtp;

  /// No description provided for @enterOtpDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter the OTP code we just sent you on your registered Email'**
  String get enterOtpDescription;

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get enter;

  /// No description provided for @didntGetOtp.
  ///
  /// In en, this message translates to:
  /// **'Didn’t get OTP?'**
  String get didntGetOtp;

  /// No description provided for @resendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resendOtp;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @resetPasswordDescription.
  ///
  /// In en, this message translates to:
  /// **'Please enter your new password twice to confirm'**
  String get resetPasswordDescription;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @reEnterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Re-Enter New Password'**
  String get reEnterNewPassword;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;
}

class _VelocioLocalizationDelegate extends LocalizationsDelegate<VelocioLocalization> {
  const _VelocioLocalizationDelegate();

  @override
  Future<VelocioLocalization> load(Locale locale) {
    return SynchronousFuture<VelocioLocalization>(lookupVelocioLocalization(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'it', 'ru', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_VelocioLocalizationDelegate old) => false;
}

VelocioLocalization lookupVelocioLocalization(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return VelocioLocalizationEn();
    case 'it': return VelocioLocalizationIt();
    case 'ru': return VelocioLocalizationRu();
    case 'tr': return VelocioLocalizationTr();
  }

  throw FlutterError(
    'VelocioLocalization.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
