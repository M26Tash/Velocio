// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/widgets/custom_vector/custom_vector.dart';
import 'package:velocio/src/common/widgets/option_tile/option_tile.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class CustomDrawer extends StatefulWidget {
  final ProfileModel profileModel;
  final VoidCallback onContactPageTap;
  final VoidCallback onSettingsPageTap;
  const CustomDrawer({
    required this.profileModel,
    required this.onContactPageTap,
    required this.onSettingsPageTap,
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.superLarge,
        horizontal: AppDimensions.large,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: widget.profileModel.avatarUrl != null
                    ? NetworkImage(widget.profileModel.avatarUrl!)
                    : null,
                child: widget.profileModel.avatarUrl == null
                    ? CustomVector(
                        assetPath: AppAssets.imageIcon,
                        height: 30,
                        color: context.theme.primaryIconColor,
                      )
                    : const SizedBox.shrink(),
              ),
              const SizedBox(width: AppDimensions.medium),
              Expanded(
                child: Text(
                  '@${widget.profileModel.username}',
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    color: context.theme.primaryTextColor,
                    fontWeight: AppFonts.weightRegular,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.extraLarge),
          OptionTile(
            assetPath: AppAssets.contactIcon,
            option: context.locale.contacts,
            onTap: widget.onContactPageTap,
          ),
          OptionTile(
            assetPath: AppAssets.savedMessagesIcon,
            option: context.locale.savedMessages,
          ),
          OptionTile(
            assetPath: AppAssets.settingsIcon,
            option: context.locale.settings,
            onTap: widget.onSettingsPageTap,
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                context.locale.version('1.0'),
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightRegular,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
