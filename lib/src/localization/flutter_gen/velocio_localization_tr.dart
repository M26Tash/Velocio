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
  String enterOtpDescription(Object email) {
    return 'Kayıtlı E-posta adresinize gönderdiğimiz OTP kodunu girin';
  }

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

  @override
  String get search => 'Ara...';

  @override
  String get contacts => 'Kişiler';

  @override
  String get savedMessages => 'Kayıtlı Mesajlar';

  @override
  String get settings => 'Ayarlar';

  @override
  String version(Object version) {
    return 'Sürüm $version';
  }

  @override
  String get myAccount => 'Hesabım';

  @override
  String get notification => 'Bildirimler';

  @override
  String get security => 'Güvenlik';

  @override
  String get privacy => 'Gizlilik';

  @override
  String get devices => 'Cihazlar';

  @override
  String get language => 'Dil';

  @override
  String get theme => 'Mod';

  @override
  String get darkTheme => 'Gece modu';

  @override
  String get lightTheme => 'Gündüz modu';

  @override
  String get systemTheme => 'Sistem';

  @override
  String get pleaseReEnterPassword => 'Lütfen Şifrenizi Yeniden Girin';

  @override
  String get minimumEightCharacter => 'Minimum 8 karakter gereklidir';

  @override
  String get pleaseEnterYourEmail => 'Lütfen E-postanızı Girin';

  @override
  String get pleaseEnterYourCorrectEmail => 'Lütfen Doğru E-postayı Girin';

  @override
  String get enterEmail => 'E-postayı girin';

  @override
  String get enterYourEmailOtpCode => 'Lütfen e-postanızı girin, size OTP kodu göndereceğiz';

  @override
  String get pleaseEnterOtp => 'Lütfen OTP Girin';

  @override
  String get makeSureOtpContainSixDigits => 'Lütfen OTP\'nin 6 haneli olduğundan emin olun';

  @override
  String get passwordDoesNotMatch => 'Şifreler Uyuşmuyor';

  @override
  String get bio => 'BİO';

  @override
  String get finish => 'Bitir';

  @override
  String get username => 'Kullanıcı Adı';

  @override
  String get pleaseEnterYourUsername => 'Lütfen Kullanıcı Adınızı Girin';

  @override
  String get fullName => 'Tam Adı';

  @override
  String get pleaseUseOnlyLetters => 'Lütfen yalnızca harf kullanın';

  @override
  String get dateOfBirth => 'Doğum Tarihi';

  @override
  String get pleaseEnterYourFullName => 'Lütfen Tam Adınızı Girin';

  @override
  String get location => 'Konum';

  @override
  String get pleaseEnterYourLocation => 'Lütfen Konumunuzu Girin';

  @override
  String get pleaseEnterYourBIO => 'Lütfen BİO\'nuzu Girin';

  @override
  String get velocio => 'Velocio';

  @override
  String get signOut => 'Çıkış Yap';

  @override
  String get pickImage => 'Resim Seç';

  @override
  String get editFullName => 'Tam Adı Düzenle';

  @override
  String get editUsername => 'Kullanıcı Adını Düzenle';

  @override
  String get editDateOfBirth => 'Doğum Tarihini Düzenle';

  @override
  String get editLocation => 'Konumu Düzenle';

  @override
  String get editBIO => 'BİO\'yu Düzenle';

  @override
  String get biometricData => 'Biyometrik Veri';

  @override
  String get changePassword => 'Şifreyi Değiştir';

  @override
  String get bellowYouCanSeeAllTheDevices => 'Aşağıda, hesabınızla ilişkili tüm cihazları, IP adreslerini ve giriş zamanlarını görebilirsiniz.';

  @override
  String get ip => 'IP';

  @override
  String get dateAndTime => 'Tarih ve Saat';

  @override
  String get english => 'İngilizce';

  @override
  String get turkish => 'Türkçe';

  @override
  String get russian => 'Rusça';

  @override
  String get italian => 'İtalyanca';

  @override
  String get passwordChanged => 'Şifre değişti';
}
