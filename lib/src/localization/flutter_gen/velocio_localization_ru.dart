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
  String enterOtpDescription(Object email) {
    return 'Введите код OTP, который мы только что отправили вам на зарегистрированную электронную почту';
  }

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

  @override
  String get search => 'Поиск...';

  @override
  String get contacts => 'Контакты';

  @override
  String get savedMessages => 'Сохранённые сообщения';

  @override
  String get settings => 'Настройки';

  @override
  String version(Object version) {
    return 'Версия $version';
  }

  @override
  String get myAccount => 'Мой аккаунт';

  @override
  String get notification => 'Уведомления';

  @override
  String get security => 'Безопасность';

  @override
  String get privacy => 'Конфиденциальность';

  @override
  String get devices => 'Устройства';

  @override
  String get language => 'Язык';

  @override
  String get theme => 'Тема';

  @override
  String get darkTheme => 'Тёмная тема';

  @override
  String get lightTheme => 'Светлая тема';

  @override
  String get systemTheme => 'Системная';

  @override
  String get pleaseReEnterPassword => 'Пожалуйста, введите пароль повторно';

  @override
  String get minimumEightCharacter => 'Требуется минимум 8 символов';

  @override
  String get pleaseEnterYourEmail => 'Пожалуйста, введите вашу электронную почту';

  @override
  String get pleaseEnterYourCorrectEmail => 'Пожалуйста, введите правильную электронную почту';

  @override
  String get enterEmail => 'Введите электронную почту';

  @override
  String get enterYourEmailOtpCode => 'Пожалуйста, введите вашу электронную почту, мы отправим вам OTP код';

  @override
  String get pleaseEnterOtp => 'Пожалуйста, введите OTP';

  @override
  String get makeSureOtpContainSixDigits => 'Пожалуйста, убедитесь, что OTP состоит из 6 цифр';

  @override
  String get passwordDoesNotMatch => 'Пароли не совпадают';

  @override
  String get bio => 'БИО';

  @override
  String get finish => 'Завершить';

  @override
  String get username => 'Имя пользователя';

  @override
  String get pleaseEnterYourUsername => 'Пожалуйста, введите ваше имя пользователя';

  @override
  String get fullName => 'Полное имя';

  @override
  String get pleaseUseOnlyLetters => 'Пожалуйста, используйте только буквы';

  @override
  String get dateOfBirth => 'Дата рождения';

  @override
  String get pleaseEnterYourFullName => 'Пожалуйста, введите ваше полное имя';

  @override
  String get location => 'Местоположение';

  @override
  String get pleaseEnterYourLocation => 'Пожалуйста, введите ваше местоположение';

  @override
  String get pleaseEnterYourBIO => 'Пожалуйста, введите ваше БИО';

  @override
  String get velocio => 'Velocio';

  @override
  String get signOut => 'Выйти';

  @override
  String get pickImage => 'Выбрать изображение';

  @override
  String get editFullName => 'Редактировать полное имя';

  @override
  String get editUsername => 'Редактировать имя пользователя';

  @override
  String get editDateOfBirth => 'Редактировать дату рождения';

  @override
  String get editLocation => 'Редактировать местоположение';

  @override
  String get editBIO => 'Редактировать БИО';

  @override
  String get biometricData => 'Биометрические данные';

  @override
  String get changePassword => 'Сменить пароль';

  @override
  String get bellowYouCanSeeAllTheDevices => 'Ниже вы можете увидеть все устройства, IP-адреса и время входа, связанные с вашей учетной записью.';

  @override
  String get ip => 'IP';

  @override
  String get dateAndTime => 'Дата и время';

  @override
  String get english => 'Английский';

  @override
  String get turkish => 'Турецкий';

  @override
  String get russian => 'Русский';

  @override
  String get italian => 'Итальянский';

  @override
  String get passwordChanged => 'Пароль изменен';
}
