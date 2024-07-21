import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';

class ContactItem extends StatelessWidget {
  final String contactName;
  final String contactLastMessage;
  final String contactLastMessageDate;
  final VoidCallback onTap;
  const ContactItem({
    required this.contactName,
    required this.contactLastMessage,
    required this.contactLastMessageDate,
    required this.onTap,
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
          decoration: BoxDecoration(
            color: context.theme.secondaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                AppDimensions.medium,
              ),
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 5,
                color: context.theme.tertiaryColor,
              ),
            ],
          ),
          child: Row(
            children: [
              const CircleAvatar(),
              const SizedBox(width: AppDimensions.medium),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          contactName,
                          style: context.themeData.textTheme.headlineMedium
                              ?.copyWith(
                            color: context.theme.primaryTextColor,
                            fontWeight: AppFonts.weightMedium,
                          ),
                        ),
                        Text(
                          contactLastMessageDate,
                          style: context.themeData.textTheme.headlineMedium
                              ?.copyWith(
                            color: context.theme.secondaryTextColor,
                            fontWeight: AppFonts.weightRegular,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      contactLastMessage,
                      style:
                          context.themeData.textTheme.headlineSmall?.copyWith(
                        color: context.theme.secondaryTextColor,
                        fontWeight: AppFonts.weightRegular,
                      ),
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
