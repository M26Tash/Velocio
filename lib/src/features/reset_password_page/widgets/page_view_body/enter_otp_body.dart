import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/utils/extensions/snackbar_context_extension.dart';
import 'package:velocio/src/common/widgets/custom_button/custom_button.dart';
import 'package:velocio/src/features/reset_password_page/cubit/reset_password_cubit.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class EnterOtpBody extends StatefulWidget {
  final ResetPasswordCubit cubit;
  final PageController controller;
  final String email;
  const EnterOtpBody({
    required this.cubit,
    required this.controller,
    required this.email,
    super.key,
  });

  @override
  State<EnterOtpBody> createState() => _EnterOtpBodyState();
}

class _EnterOtpBodyState extends State<EnterOtpBody> {
  final pinputFormKey = GlobalKey<FormState>();

  late final TextEditingController _pinputController;

  @override
  void initState() {
    super.initState();

    _pinputController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _pinputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        Image.asset(AppAssets.mailSentIllustration),
        Text(
          context.locale.enterOtp,
          style: context.themeData.textTheme.displayLarge?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightSemiBold,
          ),
        ),
        const SizedBox(height: AppDimensions.small),
        Text(
          context.locale.enterOtpDescription(widget.email),
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        const SizedBox(height: AppDimensions.large),
        Pinput(
          key: pinputFormKey,
          controller: _pinputController,
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
          validator: (value) {
            if (value!.isEmpty) {
              return context.locale.enterOtp;
            } else if (value.length < 6) {
              return context.locale.makeSureOtpContainSixDigits;
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: AppDimensions.superLarge),
        CustomButton(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 5,
              color: context.theme.mainColor,
            ),
          ],
          text: context.locale.submit,
          onTap: () => widget.cubit.verifyOtp(
            email: widget.email,
            token: _pinputController.text.trim(),
            onError: (error) => context.showErrorSnackbar(error),
            onSuccess: () => widget.controller.animateToPage(
              2,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            ),
          ),
        ),
      ],
    );
  }
}
