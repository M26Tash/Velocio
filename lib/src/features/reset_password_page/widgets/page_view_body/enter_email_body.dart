// ignore_for_file: use_if_null_to_convert_nulls_to_bools

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/utils/extensions/snackbar_context_extension.dart';
import 'package:velocio/src/common/widgets/custom_button/custom_button.dart';
import 'package:velocio/src/common/widgets/input_field/input_field.dart';
import 'package:velocio/src/common/widgets/support_methods/support_methods.dart';
import 'package:velocio/src/features/reset_password_page/cubit/reset_password_cubit.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class EnterEmailBody extends StatefulWidget {
  final ResetPasswordCubit cubit;
  final PageController controller;
  const EnterEmailBody({
    required this.cubit,
    required this.controller,
    super.key,
  });

  @override
  State<EnterEmailBody> createState() => _EnterEmailBodyState();
}

class _EnterEmailBodyState extends State<EnterEmailBody> {
  final emailFormKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        Image.asset(AppAssets.emailIllustration),
        Text(
          context.locale.enterEmail,
          style: context.themeData.textTheme.displayLarge?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightSemiBold,
          ),
        ),
        const SizedBox(height: AppDimensions.small),
        Text(
          context.locale.enterYourEmailOtpCode,
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          formKey: emailFormKey,
          controller: _emailController,
          hintText: context.locale.email,
          validator: (value) {
            if (value!.isEmpty) {
              return context.locale.pleaseEnterYourEmail;
            } else if (!EmailValidator.validate(value)) {
              return context.locale.pleaseEnterYourCorrectEmail;
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
          onTap: () {
            final validateEmail = emailFormKey.currentState?.validate();

            if (validateEmail == true) {
              SupportMethods.showCircularProgress(context);

              widget.cubit.signInWithOtp(
                email: _emailController.text.trim(),
                onError: (error) => context.showErrorSnackbar(error),
                onSuccess: () {
                  widget
                    ..cubit.onBackTap()
                    ..controller.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
