import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/common/shared_cubits/app_locale_cubit/app_locale_cubit.dart';
import 'package:velocio/src/common/shared_cubits/app_overlay/app_overlay_cubit.dart';
import 'package:velocio/src/common/shared_cubits/navigation_panel/navigation_panel_cubit.dart';
import 'package:velocio/src/common/shared_cubits/theme_cubit/theme_shared_cubit.dart';
import 'package:velocio/src/features/app/cubit/app_cubit.dart';
import 'package:velocio/src/features/auth_page/cubit/auth_cubit.dart';
import 'package:velocio/src/features/bio_page/cubit/bio_cubit.dart';
import 'package:velocio/src/features/chat_page/cubit/chat_cubit.dart';
import 'package:velocio/src/features/contact_page/cubit/contact_cubit.dart';
import 'package:velocio/src/features/device_management_page/cubit/device_management_cubit.dart';
import 'package:velocio/src/features/main_page/cubit/main_cubit.dart';
import 'package:velocio/src/features/my_account_page/cubit/my_account_cubit.dart';
import 'package:velocio/src/features/otp_page/cubit/otp_cubit.dart';
import 'package:velocio/src/features/privacy_page/cubit/privacy_cubit.dart';
import 'package:velocio/src/features/reset_password_page/cubit/reset_password_cubit.dart';
import 'package:velocio/src/features/security_page/cubit/security_cubit.dart';
import 'package:velocio/src/features/settings_page/cubit/settings_cubit.dart';

void initSharedCubits() {
  i
    ..registerSingleton<AppOverlayCubit>(
      AppOverlayCubit(),
    )
    ..registerFactory<NavigationPanelCubit>(
      NavigationPanelCubit.new,
    )
    ..registerSingleton<ThemeCubit>(
      ThemeCubit(
        i.get(),
      ),
    )
    ..registerSingleton<AppLocaleCubit>(
      AppLocaleCubit(
        i.get(),
      ),
    );
}

void initCubits() {
  i
    ..registerFactory<AppCubit>(
      () => AppCubit(
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<AuthCubit>(
      () => AuthCubit(
        i.get(),
      ),
    )
    ..registerFactory<OtpCubit>(OtpCubit.new)
    ..registerFactory<ResetPasswordCubit>(
      () => ResetPasswordCubit(
        i.get(),
      ),
    )
    ..registerFactory<MainCubit>(
      MainCubit.new,
    )
    ..registerFactory<SettingsCubit>(
      () => SettingsCubit(
        i.get(),
        i.get(),
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<ContactCubit>(
      () => ContactCubit(
        i.get(),
      ),
    )
    ..registerFactory<DeviceManagementCubit>(
      DeviceManagementCubit.new,
    )
    ..registerFactory<BioCubit>(
      () => BioCubit(
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<MyAccountCubit>(
      () => MyAccountCubit(
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<PrivacyCubit>(
      PrivacyCubit.new,
    )
    ..registerFactory<SecurityCubit>(
      () => SecurityCubit(
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<ChatCubit>(
      () => ChatCubit(
        i.get(),
      ),
    );
}
