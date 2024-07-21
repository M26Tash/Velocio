import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class DeviceManagementBody extends StatelessWidget {
  const DeviceManagementBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        Text(
          context.locale.bellowYouCanSeeAllTheDevices,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        const DeviceItem(
          operatingSystem: 'Android 14',
          deviceModel: 'SM 9731ZF',
          ipAddress: '193.41.491.402',
          dateTime: '03 July 2024, 13:53:33',
        ),
      ],
    );
  }
}

class DeviceItem extends StatelessWidget {
  final String operatingSystem;
  final String deviceModel;
  final String ipAddress;
  final String dateTime;
  const DeviceItem({
    required this.operatingSystem,
    required this.deviceModel,
    required this.ipAddress,
    required this.dateTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.large),
      margin: const EdgeInsets.symmetric(vertical: AppDimensions.large),
      decoration: BoxDecoration(
        color: context.theme.tertiaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.medium,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '$operatingSystem - $deviceModel',
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.medium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.locale.ip,
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
              Text(
                ipAddress,
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.medium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.locale.dateAndTime,
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
              Text(
                dateTime,
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
