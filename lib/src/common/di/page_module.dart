import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/features/auth_page/pages/auth_page.dart';
import 'package:velocio/src/features/otp_page/pages/otp_page.dart';
import 'package:velocio/src/features/reset_password_page/pages/reset_password_page.dart';

void initPages() {
  i
    ..registerFactory<AuthPage>(AuthPage.new)
    ..registerFactory<OtpPage>(OtpPage.new)
    ..registerFactory<ResetPasswordPage>(ResetPasswordPage.new);
}
