import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/widgets/custom_button/custom_button.dart';
import 'package:velocio/src/common/widgets/input_field/input_field.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class SignUpBody extends StatefulWidget {
  final VoidCallback showLogin;
  const SignUpBody({
    required this.showLogin,
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController passwordController;

  bool isObscured = false;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  void toggleObscure() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        const SizedBox(height: AppDimensions.superLarge),
        Text(
          context.locale.signUp,
          style: context.themeData.textTheme.displayLarge?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightSemiBold,
          ),
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        InputField(
          controller: nameController,
          hintText: context.locale.name,
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          controller: emailController,
          hintText: context.locale.email,
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          controller: phoneNumberController,
          hintText: context.locale.phoneNumber,
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          controller: passwordController,
          hintText: context.locale.password,
          obscureText: isObscured,
          suffixIcon: IconButton(
            icon: Icon(
              isObscured ? Icons.visibility_off : Icons.visibility,
              color: context.theme.secondaryIconColor,
            ),
            onPressed: toggleObscure,
          ),
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
          text: context.locale.createAccount,
          onTap: () {},
        ),
        const SizedBox(height: AppDimensions.large),
        Row(
          children: [
            Text(
              context.locale.doYouHaveAccount,
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                fontWeight: AppFonts.weightRegular,
                color: context.theme.secondaryTextColor,
              ),
            ),
            const SizedBox(width: AppDimensions.small),
            InkWell(
              onTap: widget.showLogin,
              child: Text(
                context.locale.login,
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
