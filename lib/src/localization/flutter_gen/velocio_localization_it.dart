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
  String enterOtpDescription(Object email) {
    return 'Inserisci il codice OTP che ti abbiamo appena inviato alla tua Email registrata';
  }

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

  @override
  String get search => 'Cerca...';

  @override
  String get contacts => 'Contatti';

  @override
  String get savedMessages => 'Messaggi Salvati';

  @override
  String get settings => 'Impostazioni';

  @override
  String version(Object version) {
    return 'Versione $version';
  }

  @override
  String get myAccount => 'Il mio account';

  @override
  String get notification => 'Notifiche';

  @override
  String get security => 'Sicurezza';

  @override
  String get privacy => 'Privacy';

  @override
  String get devices => 'Dispositivi';

  @override
  String get language => 'Lingua';

  @override
  String get theme => 'Tema';

  @override
  String get darkTheme => 'Tema Scuro';

  @override
  String get lightTheme => 'Tema Chiaro';

  @override
  String get systemTheme => 'Sistema';

  @override
  String get pleaseReEnterPassword => 'Per favore reinserisci la password';

  @override
  String get minimumEightCharacter => 'Sono richiesti almeno 8 caratteri';

  @override
  String get pleaseEnterYourEmail => 'Per favore inserisci la tua email';

  @override
  String get pleaseEnterYourCorrectEmail => 'Per favore inserisci la tua email corretta';

  @override
  String get enterEmail => 'Inserisci email';

  @override
  String get enterYourEmailOtpCode => 'Per favore inserisci la tua email, ti invieremo un codice OTP';

  @override
  String get pleaseEnterOtp => 'Per favore inserisci l\'OTP';

  @override
  String get makeSureOtpContainSixDigits => 'Assicurati che l\'OTP contenga 6 cifre';

  @override
  String get passwordDoesNotMatch => 'Le password non corrispondono';

  @override
  String get bio => 'BIO';

  @override
  String get finish => 'Finisci';

  @override
  String get username => 'Nome utente';

  @override
  String get pleaseEnterYourUsername => 'Per favore inserisci il tuo nome utente';

  @override
  String get fullName => 'Nome completo';

  @override
  String get pleaseUseOnlyLetters => 'Per favore usa solo lettere';

  @override
  String get dateOfBirth => 'Data di nascita';

  @override
  String get pleaseEnterYourFullName => 'Per favore inserisci il tuo nome completo';

  @override
  String get location => 'Posizione';

  @override
  String get pleaseEnterYourLocation => 'Per favore inserisci la tua posizione';

  @override
  String get pleaseEnterYourBIO => 'Per favore inserisci il tuo BIO';

  @override
  String get velocio => 'Velocio';

  @override
  String get signOut => 'Disconnettersi';

  @override
  String get pickImage => 'Scegli immagine';

  @override
  String get editFullName => 'Modifica nome completo';

  @override
  String get editUsername => 'Modifica nome utente';

  @override
  String get editDateOfBirth => 'Modifica data di nascita';

  @override
  String get editLocation => 'Modifica posizione';

  @override
  String get editBIO => 'Modifica BIO';

  @override
  String get biometricData => 'Dati biometrici';

  @override
  String get changePassword => 'Cambia la password';

  @override
  String get bellowYouCanSeeAllTheDevices => 'Sotto puoi vedere tutti i dispositivi, indirizzi IP e orari di accesso associati al tuo account.';

  @override
  String get ip => 'IP';

  @override
  String get dateAndTime => 'Data e ora';

  @override
  String get english => 'Inglese';

  @override
  String get turkish => 'Turco';

  @override
  String get russian => 'Russo';

  @override
  String get italian => 'Italiano';

  @override
  String get passwordChanged => 'Password cambiata';
}
