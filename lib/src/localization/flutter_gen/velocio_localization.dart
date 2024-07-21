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
  /// **'Please enter your OTP code that we sent on {email}'**
  String enterOtpDescription(Object email);

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

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get search;

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @savedMessages.
  ///
  /// In en, this message translates to:
  /// **'Saved Messages'**
  String get savedMessages;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String version(Object version);

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get myAccount;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @devices.
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get devices;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get darkTheme;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light Theme'**
  String get lightTheme;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemTheme;

  /// No description provided for @pleaseReEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please Re-Enter Password'**
  String get pleaseReEnterPassword;

  /// No description provided for @minimumEightCharacter.
  ///
  /// In en, this message translates to:
  /// **'Minimum 8 characters required'**
  String get minimumEightCharacter;

  /// No description provided for @pleaseEnterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Your Email'**
  String get pleaseEnterYourEmail;

  /// No description provided for @pleaseEnterYourCorrectEmail.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Correct Email'**
  String get pleaseEnterYourCorrectEmail;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get enterEmail;

  /// No description provided for @enterYourEmailOtpCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email, we will send you OTP code'**
  String get enterYourEmailOtpCode;

  /// No description provided for @pleaseEnterOtp.
  ///
  /// In en, this message translates to:
  /// **'Please Enter OTP'**
  String get pleaseEnterOtp;

  /// No description provided for @makeSureOtpContainSixDigits.
  ///
  /// In en, this message translates to:
  /// **'Please make sure that OTP contain 6 digits'**
  String get makeSureOtpContainSixDigits;

  /// No description provided for @passwordDoesNotMatch.
  ///
  /// In en, this message translates to:
  /// **''**
  String get passwordDoesNotMatch;

  /// No description provided for @bio.
  ///
  /// In en, this message translates to:
  /// **'BIO'**
  String get bio;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @pleaseEnterYourUsername.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Your Username'**
  String get pleaseEnterYourUsername;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @pleaseUseOnlyLetters.
  ///
  /// In en, this message translates to:
  /// **'Please use only letters'**
  String get pleaseUseOnlyLetters;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @pleaseEnterYourFullName.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Your Full name'**
  String get pleaseEnterYourFullName;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @pleaseEnterYourLocation.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Your Location'**
  String get pleaseEnterYourLocation;

  /// No description provided for @pleaseEnterYourBIO.
  ///
  /// In en, this message translates to:
  /// **''**
  String get pleaseEnterYourBIO;

  /// No description provided for @velocio.
  ///
  /// In en, this message translates to:
  /// **'Velocio'**
  String get velocio;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @pickImage.
  ///
  /// In en, this message translates to:
  /// **'Pick Image'**
  String get pickImage;

  /// No description provided for @editFullName.
  ///
  /// In en, this message translates to:
  /// **'Edit Full Name'**
  String get editFullName;

  /// No description provided for @editUsername.
  ///
  /// In en, this message translates to:
  /// **'Edit Username'**
  String get editUsername;

  /// No description provided for @editDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Edit Date Of Birth'**
  String get editDateOfBirth;

  /// No description provided for @editLocation.
  ///
  /// In en, this message translates to:
  /// **'Edit Location'**
  String get editLocation;

  /// No description provided for @editBIO.
  ///
  /// In en, this message translates to:
  /// **'Edit BIO'**
  String get editBIO;

  /// No description provided for @biometricData.
  ///
  /// In en, this message translates to:
  /// **'Biometric Data'**
  String get biometricData;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @bellowYouCanSeeAllTheDevices.
  ///
  /// In en, this message translates to:
  /// **'Below you can see all the devices, IP addresses, and login times associated with your account.'**
  String get bellowYouCanSeeAllTheDevices;

  /// No description provided for @ip.
  ///
  /// In en, this message translates to:
  /// **'IP'**
  String get ip;

  /// No description provided for @dateAndTime.
  ///
  /// In en, this message translates to:
  /// **'Date and Time'**
  String get dateAndTime;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @turkish.
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get turkish;

  /// No description provided for @russian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get russian;

  /// No description provided for @italian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get italian;

  /// No description provided for @passwordChanged.
  ///
  /// In en, this message translates to:
  /// **'Password Changed'**
  String get passwordChanged;
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
