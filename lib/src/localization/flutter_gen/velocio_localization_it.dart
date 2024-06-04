import 'velocio_localization.dart';

/// The translations for Italian (`it`).
class VelocioLocalizationIt extends VelocioLocalization {
  VelocioLocalizationIt([String locale = 'it']) : super(locale);

  @override
  String get loginYourAccount => 'Accedi al tuo account';

  @override
  String get phoneNumberOrEmail => 'Numero di telefono / Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Hai dimenticato la password?';

  @override
  String get login => 'Accedi';

  @override
  String get dontHaveAccount => 'Non hai un account?';

  @override
  String get signUp => 'Registrati';

  @override
  String get name => 'Nome';

  @override
  String get email => 'Email';

  @override
  String get phoneNumber => 'Numero di telefono';

  @override
  String get createAccount => 'Crea un account';

  @override
  String get doYouHaveAccount => 'Hai un account?';

  @override
  String get enterOtp => 'Inserisci OTP';

  @override
  String get enterOtpDescription => 'Inserisci il codice OTP che ti abbiamo appena inviato alla tua Email registrata';

  @override
  String get enter => 'Inserisci';

  @override
  String get didntGetOtp => 'Non hai ricevuto l\'OTP?';

  @override
  String get resendOtp => 'Reinvia OTP';

  @override
  String get resetPassword => 'Reimposta Password';

  @override
  String get resetPasswordDescription => 'Si prega di inserire la nuova password due volte per confermare';

  @override
  String get newPassword => 'Nuova Password';

  @override
  String get reEnterNewPassword => 'Reinserisci Nuova Password';

  @override
  String get submit => 'Invia';
}
