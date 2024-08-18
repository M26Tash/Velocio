import 'package:velocio/src/common/navigation/entities/page_configuration.dart';
import 'package:velocio/src/common/navigation/routes.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';
import 'package:velocio/src/features/bio_page/pages/bio_page.dart';
import 'package:velocio/src/features/chat_page/pages/chat_page.dart';

PageConfiguration authConfig() {
  return PageConfiguration(path: Routes.authPath.name);
}

PageConfiguration otpConfig() {
  return PageConfiguration(path: Routes.otpPath.name);
}

PageConfiguration resetPasswordConfig() {
  return PageConfiguration(path: Routes.resetPasswordPath.name);
}

PageConfiguration mainConfig() {
  return PageConfiguration(path: Routes.mainPath.name);
}

PageConfiguration settingsConfig() {
  return PageConfiguration(
    path: Routes.settingsPath.name,
  );
}

PageConfiguration contactConfig() {
  return PageConfiguration(path: Routes.contactPath.name);
}

PageConfiguration deviceManagementConfig() {
  return PageConfiguration(path: Routes.deviceManagementPath.name);
}

PageConfiguration bioConfig({
  required String? email,
  required String? phoneNumber,
}) {
  return PageConfiguration(
    path: Routes.bioPath.name,
    args: BioArguments(
      email: email,
      phoneNumber: phoneNumber,
    ),
  );
}

PageConfiguration myAccountConfig() {
  return PageConfiguration(path: Routes.myAccountPath.name);
}

PageConfiguration privacyConfig() {
  return PageConfiguration(path: Routes.privacyPath.name);
}

PageConfiguration securityConfig() {
  return PageConfiguration(path: Routes.securityPath.name);
}

PageConfiguration chatConfig({
  required String? chatId,
  required String? receiverName,
  required ProfileModel? profile,
}) {
  return PageConfiguration(
    path: Routes.chatPath.name,
    args: ChatArguments(
      chatId: chatId,
      receiverName: receiverName,
      profile: profile,
    ),
  );
}
