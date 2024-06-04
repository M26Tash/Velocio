import 'velocio_localization.dart';

/// The translations for Turkish (`tr`).
class VelocioLocalizationTr extends VelocioLocalization {
  VelocioLocalizationTr([String locale = 'tr']) : super(locale);

  @override
  String get loginYourAccount => 'Hesabınıza Giriş Yapın';

  @override
  String get phoneNumberOrEmail => 'Telefon Numarası / E-posta';

  @override
  String get password => 'Şifre';

  @override
  String get forgotPassword => 'Şifrenizi mi unuttunuz?';

  @override
  String get login => 'Giriş Yap';

  @override
  String get dontHaveAccount => 'Hesabınız yok mu?';

  @override
  String get signUp => 'Kayıt Ol';

  @override
  String get name => 'İsim';

  @override
  String get email => 'E-posta';

  @override
  String get phoneNumber => 'Telefon Numarası';

  @override
  String get createAccount => 'Hesap Oluştur';

  @override
  String get doYouHaveAccount => 'Hesabınız var mı?';

  @override
  String get enterOtp => 'OTP Girin';

  @override
  String get enterOtpDescription => 'Kayıtlı E-posta adresinize gönderdiğimiz OTP kodunu girin';

  @override
  String get enter => 'Girin';

  @override
  String get didntGetOtp => 'OTP almadınız mı?';

  @override
  String get resendOtp => 'OTP\'yi tekrar gönder';

  @override
  String get resetPassword => 'Şifreyi Sıfırla';

  @override
  String get resetPasswordDescription => 'Onaylamak için lütfen yeni şifrenizi iki kez girin';

  @override
  String get newPassword => 'Yeni Şifre';

  @override
  String get reEnterNewPassword => 'Yeni Şifreyi Yeniden Girin';

  @override
  String get submit => 'Gönder';
}
