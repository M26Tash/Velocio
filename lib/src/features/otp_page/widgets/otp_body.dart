import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/widgets/custom_button/custom_button.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class OtpBody extends StatefulWidget {
  const OtpBody({super.key});

  @override
  State<OtpBody> createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  late final TextEditingController pinputController;

  @override
  void initState() {
    super.initState();

    pinputController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    pinputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        const SizedBox(height: AppDimensions.superLarge),
        Text(
          context.locale.enterOtp,
          style: context.themeData.textTheme.displayLarge?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightSemiBold,
          ),
        ),
        const SizedBox(height: AppDimensions.medium),
        Text(
          context.locale.enterOtpDescription,
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        Pinput(
          controller: pinputController,
          length: AppDimensions.pinputLength,
          defaultPinTheme: PinTheme(
            height: AppDimensions.pinputHeight,
            width: AppDimensions.pinputWidth,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: context.theme.inputFieldFillColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  AppDimensions.medium,
                ),
              ),
            ),
            textStyle: context.themeData.textTheme.displayLarge?.copyWith(
              fontWeight: AppFonts.weightRegular,
              color: context.theme.tertiaryTextColor,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        CustomButton(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 5,
              color: context.theme.mainColor,
            ),
          ],
          text: context.locale.enter,
          onTap: () {},
        ),
        const SizedBox(height: AppDimensions.large),
        Row(
          children: [
            Text(
              context.locale.didntGetOtp,
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                fontWeight: AppFonts.weightRegular,
                color: context.theme.secondaryTextColor,
              ),
            ),
            const SizedBox(width: AppDimensions.small),
            InkWell(
              onTap: (){},
              child: Text(
                context.locale.resendOtp,
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  fontWeight: AppFonts.weightRegular,
                  color: context.theme.quaternaryTextColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
