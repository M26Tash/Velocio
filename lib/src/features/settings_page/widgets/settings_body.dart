import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/utils/enum/theme_type.dart';
import 'package:velocio/src/common/utils/extensions/snackbar_context_extension.dart';
import 'package:velocio/src/common/widgets/custom_vector/custom_vector.dart';
import 'package:velocio/src/common/widgets/language_option_tile/language_option_tile.dart';
import 'package:velocio/src/common/widgets/option_tile/option_tile.dart';
import 'package:velocio/src/common/widgets/support_methods/support_methods.dart';
import 'package:velocio/src/common/widgets/theme_option_tile/theme_option_tile.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';
import 'package:velocio/src/features/settings_page/cubit/settings_cubit.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class SettingsBody extends StatefulWidget {
  final ThemeType currentThemeType;
  final Locale currentLocale;
  final SettingsCubit cubit;
  final String? avatarUrl;
  final String? fullName;
  final ProfileModel profileModel;
  const SettingsBody({
    required this.currentThemeType,
    required this.currentLocale,
    required this.cubit,
    required this.avatarUrl,
    required this.fullName,
    required this.profileModel,
    super.key,
  });

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  Future<void> showBottomSheet({
    required BuildContext context,
    required Widget child,
    required String sheetTitle,
  }) {
    return SupportMethods.showBottomSheet(
      context: context,
      sheetTitle: sheetTitle,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(
        AppDimensions.large,
      ),
      children: [
        CircleAvatar(
          backgroundColor: context.theme.secondaryColor,
          radius: 70,
          backgroundImage:
              widget.avatarUrl != null ? NetworkImage(widget.avatarUrl!) : null,
          child: widget.avatarUrl == null
              ? CustomVector(
                  assetPath: AppAssets.imageIcon,
                  height: 60,
                  color: context.theme.primaryIconColor,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(height: AppDimensions.large),
        Text(
          widget.profileModel.fullName ?? '',
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimensions.medium),
        Text(
          '${widget.profileModel.phoneNumber} | ${widget.profileModel.email}',
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        OptionTile(
          assetPath: AppAssets.myAccountIcon,
          option: context.locale.myAccount,
          onTap: widget.cubit.navigateToMyAccountPage,
        ),
        OptionTile(
          assetPath: AppAssets.notificationIcon,
          option: context.locale.notification,
        ),
        OptionTile(
          assetPath: AppAssets.securityIcon,
          option: context.locale.security,
          onTap: widget.cubit.navigateToSecurityPage,
        ),
        OptionTile(
          assetPath: AppAssets.privacyIcon,
          option: context.locale.privacy,
          onTap: widget.cubit.navigateToPrivacyPage,
        ),
        OptionTile(
          onTap: widget.cubit.navigateToDeviceManagementPage,
          assetPath: AppAssets.deviceIcon,
          option: context.locale.devices,
        ),
        OptionTile(
          assetPath: AppAssets.languageIcon,
          option: context.locale.language,
          onTap: () => showBottomSheet(
            context: context,
            sheetTitle: context.locale.language,
            child: ListView(
              shrinkWrap: true,
              children: [
                LanguageOptionTile(
                  assetPath: '',
                  option: context.locale.english,
                  value: const Locale('en'),
                  currentValue: widget.currentLocale,
                  onTap: () => widget.cubit.setLocale(const Locale('en')),
                ),
                LanguageOptionTile(
                  assetPath: '',
                  option: context.locale.turkish,
                  value: const Locale('tr'),
                  currentValue: widget.currentLocale,
                  onTap: () => widget.cubit.setLocale(const Locale('tr')),
                ),
                LanguageOptionTile(
                  assetPath: '',
                  option: context.locale.russian,
                  value: const Locale('ru'),
                  currentValue: widget.currentLocale,
                  onTap: () => widget.cubit.setLocale(const Locale('ru')),
                ),
                LanguageOptionTile(
                  assetPath: '',
                  option: context.locale.italian,
                  value: const Locale('it'),
                  currentValue: widget.currentLocale,
                  onTap: () => widget.cubit.setLocale(const Locale('it')),
                ),
              ],
            ),
          ),
        ),
        OptionTile(
          assetPath: AppAssets.darkThemeIcon,
          option: context.locale.theme,
          onTap: () => showBottomSheet(
            context: context,
            sheetTitle: context.locale.theme,
            child: ListView(
              shrinkWrap: true,
              children: [
                ThemeOptionTile(
                  assetPath: AppAssets.darkThemeIcon,
                  value: ThemeType.dark,
                  currentValue: widget.currentThemeType,
                  option: context.locale.darkTheme,
                  onTap: () => widget.cubit.setTheme(ThemeType.dark),
                ),
                ThemeOptionTile(
                  assetPath: AppAssets.lightThemeIcon,
                  value: ThemeType.light,
                  currentValue: widget.currentThemeType,
                  option: context.locale.lightTheme,
                  onTap: () => widget.cubit.setTheme(ThemeType.light),
                ),
                ThemeOptionTile(
                  assetPath: AppAssets.deviceIcon,
                  value: ThemeType.system,
                  currentValue: widget.currentThemeType,
                  option: context.locale.systemTheme,
                  onTap: () => widget.cubit.setTheme(ThemeType.system),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.large),
        OptionTile(
          assetPath: AppAssets.signOutIcon,
          option: context.locale.signOut,
          onTap: () => widget.cubit.signOut(
            onError: (error) => context.showErrorSnackbar(error),
          ),
        ),
      ],
    );
  }
}
