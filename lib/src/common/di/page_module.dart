import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/features/auth_page/pages/auth_page.dart';
import 'package:velocio/src/features/bio_page/pages/bio_page.dart';
import 'package:velocio/src/features/chat_page/pages/chat_page.dart';
import 'package:velocio/src/features/contact_page/page/contact_page.dart';
import 'package:velocio/src/features/device_management_page/pages/device_management_page.dart';
import 'package:velocio/src/features/main_page/pages/main_page.dart';
import 'package:velocio/src/features/my_account_page/pages/my_account_page.dart';
import 'package:velocio/src/features/otp_page/pages/otp_page.dart';
import 'package:velocio/src/features/privacy_page/pages/privacy_page.dart';
import 'package:velocio/src/features/reset_password_page/pages/reset_password_page.dart';
import 'package:velocio/src/features/security_page/pages/security_page.dart';
import 'package:velocio/src/features/settings_page/pages/settings_page.dart';

void initPages() {
  i
    ..registerFactory<AuthPage>(AuthPage.new)
    ..registerFactory<OtpPage>(OtpPage.new)
    ..registerFactory<ResetPasswordPage>(ResetPasswordPage.new)
    ..registerFactory<MainPage>(MainPage.new)
    ..registerFactory<SettingsPage>(SettingsPage.new)
    ..registerFactory<ContactPage>(ContactPage.new)
    ..registerFactory<DeviceManagementPage>(DeviceManagementPage.new)
    ..registerFactoryParam<BioPage, BioArguments, void>(
      (args, _) => BioPage(
        email: args.email,
        phoneNumber: args.phoneNumber,
      ),
    )
    ..registerFactory<MyAccountPage>(MyAccountPage.new)
    ..registerFactory<PrivacyPage>(PrivacyPage.new)
    ..registerFactory<SecurityPage>(SecurityPage.new)
    ..registerFactoryParam<ChatPage, ChatArguments, void>(
      (args, _) => ChatPage(
        chatId: args.chatId,
        receiverName: args.receiverName,
        profile: args.profile,
      ),
    );
}
