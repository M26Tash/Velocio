import 'velocio_localization.dart';

/// The translations for Russian (`ru`).
class VelocioLocalizationRu extends VelocioLocalization {
  VelocioLocalizationRu([String locale = 'ru']) : super(locale);

  @override
  String get loginYourAccount => 'Войти в ваш аккаунт';

  @override
  String get phoneNumberOrEmail => 'Номер телефона / Электронная почта';

  @override
  String get password => 'Пароль';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get login => 'Войти';

  @override
  String get dontHaveAccount => 'Нет аккаунта?';

  @override
  String get signUp => 'Зарегистрироваться';

  @override
  String get name => 'Имя';

  @override
  String get email => 'Электронная почта';

  @override
  String get phoneNumber => 'Номер телефона';

  @override
  String get createAccount => 'Создать аккаунт';

  @override
  String get doYouHaveAccount => 'У вас есть аккаунт?';

  @override
  String get enterOtp => 'Введите OTP';

  @override
  String get enterOtpDescription => 'Введите код OTP, который мы только что отправили вам на зарегистрированную электронную почту';

  @override
  String get enter => 'Введите';

  @override
  String get didntGetOtp => 'Не получили OTP?';

  @override
  String get resendOtp => 'Отправить OTP повторно';

  @override
  String get resetPassword => 'Сбросить пароль';

  @override
  String get resetPasswordDescription => 'Пожалуйста, введите новый пароль дважды для подтверждения';

  @override
  String get newPassword => 'Новый пароль';

  @override
  String get reEnterNewPassword => 'Повторите новый пароль';

  @override
  String get submit => 'Отправить';
}
