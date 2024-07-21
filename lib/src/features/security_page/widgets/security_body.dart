import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/extensions/snackbar_context_extension.dart';
import 'package:velocio/src/common/widgets/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:velocio/src/common/widgets/input_field/input_field.dart';
import 'package:velocio/src/common/widgets/option_tile/option_tile.dart';
import 'package:velocio/src/common/widgets/support_methods/support_methods.dart';
import 'package:velocio/src/features/security_page/cubit/security_cubit.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class SecurityBody extends StatefulWidget {
  final SecurityCubit cubit;
  const SecurityBody({
    required this.cubit,
    super.key,
  });

  @override
  State<SecurityBody> createState() => _SecurityBodyState();
}

class _SecurityBodyState extends State<SecurityBody> {
  final passwordFormKey = GlobalKey<FormState>();

  late final TextEditingController passwordController;

  bool isObscured = false;

  @override
  void initState() {
    super.initState();

    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    passwordController.dispose();
  }

  Future<void> showAlert({
    required BuildContext context,
    required Widget widget,
    required VoidCallback okayCallback,
  }) async {
    if (!context.mounted) return;

    return SupportMethods.showDialog(
      context: context,
      builder: (_) {
        return CustomAlertDialog(
          title: 'Change Password',
          widget: widget,
          okayCallback: okayCallback,
          shouldCloseOnOkTap: false,
        );
      },
    );
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
        OptionTile(
          assetPath: AppAssets.authIcon,
          option: context.locale.biometricData,
        ),
        OptionTile(
          assetPath: AppAssets.passwordIcon,
          option: context.locale.changePassword,
          onTap: () => showAlert(
            context: context,
            widget: InputField(
              formKey: passwordFormKey,
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
              validator: (value) {
                if (value!.isEmpty) {
                  return context.locale.pleaseReEnterPassword;
                } else if (value.length < 8) {
                  return context.locale.minimumEightCharacter;
                } else {
                  return null;
                }
              },
            ),
            okayCallback: () {
              final validate = passwordFormKey.currentState!.validate();

              if (validate == true) {
                widget.cubit.updateNewPassword(
                  password: passwordController.text.trim(),
                  onError: (error) => context.showErrorSnackbar(error),
                  onSuccess: () {
                    context.showSuccessSnackbar(
                      context.locale.passwordChanged,
                    );

                    widget.cubit.onBackTap();
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
