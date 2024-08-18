import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/utils/extensions/string_extension.dart';
import 'package:velocio/src/common/widgets/custom_vector/custom_vector.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class ContactItem extends StatelessWidget {
  final String? avatarUrl;
  final String contactName;
  final String? contactLastMessage;
  final String? contactLastMessageDate;
  final String? subtitle;
  final bool? isActive;
  final VoidCallback onTap;
  const ContactItem({
    required this.avatarUrl,
    required this.contactName,
    required this.onTap,
    this.contactLastMessage,
    this.contactLastMessageDate,
    this.subtitle,
    this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.medium,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(AppDimensions.medium),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                AppDimensions.medium,
              ),
            ),
          ),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: context.theme.secondaryColor,
                    radius: 25,
                    backgroundImage:
                        avatarUrl != null ? NetworkImage(avatarUrl!) : null,
                    child: avatarUrl == null
                        ? CustomVector(
                            assetPath: AppAssets.imageIcon,
                            height: 60,
                            color: context.theme.primaryIconColor,
                          )
                        : const SizedBox.shrink(),
                  ),
                  // HARD CODE
                  if (isActive!)
                    const Positioned(
                      top: 35,
                      left: 40,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Color.fromARGB(255, 0, 244, 8),
                      ),
                    ),
                  if (!isActive!)
                    const Positioned(
                      top: 35,
                      left: 40,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                ],
              ),
              const SizedBox(width: AppDimensions.medium),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            contactName,
                            style: context.themeData.textTheme.headlineMedium
                                ?.copyWith(
                              color: context.theme.primaryTextColor,
                              fontWeight: AppFonts.weightMedium,
                            ),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style:
                            context.themeData.textTheme.titleMedium?.copyWith(
                          fontSize: AppFonts.sizeTitleMedium,
                          color: context.theme.secondaryTextColor,
                          fontWeight: AppFonts.weightRegular,
                        ),
                      ),
                    if (subtitle == null)
                      Row(
                        children: [
                          Text(
                            contactLastMessage ?? '',
                            style: context.themeData.textTheme.headlineSmall
                                ?.copyWith(
                              color: context.theme.secondaryTextColor,
                              fontWeight: AppFonts.weightRegular,
                            ),
                          ),
                          const SizedBox(width: AppDimensions.small),
                          Text(
                            '·',
                            style: context.themeData.textTheme.headlineSmall
                                ?.copyWith(
                              color: context.theme.secondaryTextColor,
                              fontWeight: AppFonts.weightRegular,
                            ),
                          ),
                          const SizedBox(width: AppDimensions.small),
                          if (contactLastMessageDate != null ||
                              contactLastMessage!.isNotEmpty)
                            Text(
                              contactLastMessageDate!
                                  .formatDay(
                                    context.locale.localeName,
                                  )
                                  .capitalize(),
                              style: context.themeData.textTheme.headlineMedium
                                  ?.copyWith(
                                color: context.theme.secondaryTextColor,
                                fontWeight: AppFonts.weightRegular,
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
