import 'package:velocio/src/common/navigation/entities/base_routes.dart';

enum Routes implements BaseRoutes {
  authPath('/auth-page'),
  otpPath('/otp-page'),
  resetPasswordPath('/reset-password-page'),
  mainPath('/main-page'),
  settingsPath('/settings-page'),
  contactPath('/contact-page'),
  deviceManagementPath('/device-management-page'),
  bioPath('/bio-page'),
  myAccountPath('/my-account-page'),
  privacyPath('/privacy-page'),
  securityPath('/security-page'),
  chatPath('/chat-page');

  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}
