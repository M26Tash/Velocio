// ignore_for_file: use_if_null_to_convert_nulls_to_bools, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/utils/extensions/snackbar_context_extension.dart';
import 'package:velocio/src/common/widgets/custom_button/custom_button.dart';
import 'package:velocio/src/common/widgets/custom_vector/custom_vector.dart';
import 'package:velocio/src/common/widgets/custom_vector_button/custom_vector_button.dart';
import 'package:velocio/src/common/widgets/input_field/input_field.dart';
import 'package:velocio/src/common/widgets/support_methods/support_methods.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';
import 'package:velocio/src/features/bio_page/cubit/bio_cubit.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class BioBody extends StatefulWidget {
  final BioCubit cubit;
  final String? dateOfBirth;
  final XFile? imageFile;
  final String? avatarUrl;
  final String? email;
  final String? phoneNumber;
  const BioBody({
    required this.cubit,
    required this.dateOfBirth,
    required this.imageFile,
    required this.avatarUrl,
    required this.email,
    required this.phoneNumber,
    super.key,
  });

  @override
  State<BioBody> createState() => _BioBodyState();
}

class _BioBodyState extends State<BioBody> {
  final usernameFormKey = GlobalKey<FormState>();
  final nameFormKey = GlobalKey<FormState>();
  final locationFormKey = GlobalKey<FormState>();
  final bioFormKey = GlobalKey<FormState>();

  late final TextEditingController _usernameController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _locationController;
  late final TextEditingController _bioController;

  final nameRegExp = RegExp('[a-zA-Z]');

  @override
  void initState() {
    super.initState();

    _usernameController = TextEditingController();
    _fullNameController = TextEditingController();
    _locationController = TextEditingController();
    _bioController = TextEditingController();

    widget.cubit.getAvatarUrl();
  }

  @override
  void dispose() {
    super.dispose();

    _usernameController.dispose();
    _fullNameController.dispose();
    _locationController.dispose();
    _bioController.dispose();
  }

  Future<void> _showDatePicker() async {
    final now = DateTime.now();

    final date = await SupportMethods.showDatePicker(
      context,
      showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(1900),
        lastDate: now.copyWith(year: now.year + 1),
        confirmText: context.locale.finish,
      ),
    );

    if (date != null) widget.cubit.updateDateTime(date);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundColor: context.theme.secondaryColor,
              radius: 70,
              backgroundImage: widget.avatarUrl != null
                  ? NetworkImage(widget.avatarUrl!)
                  : null,
              child: widget.avatarUrl == null
                  ? CustomVector(
                      assetPath: AppAssets.imageIcon,
                      height: 60,
                      color: context.theme.primaryIconColor,
                    )
                  : const SizedBox.shrink(),
            ),
            // HARD CODE
            Positioned(
              top: 80,
              left: 220,
              child: CustomVectorButton(
                isSmall: true,
                buttonColor: context.theme.mainColor,
                assetPath: AppAssets.editIcon,
                onPressed: () async {
                  widget.cubit.pickImage();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        InputField(
          formKey: usernameFormKey,
          controller: _usernameController,
          hintText: context.locale.username,
          validator: (value) {
            if (value!.isEmpty) {
              return context.locale.pleaseEnterYourUsername;
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          formKey: nameFormKey,
          controller: _fullNameController,
          hintText: context.locale.fullName,
          validator: (value) {
            if (value!.isEmpty) {
              return context.locale.pleaseEnterYourFullName;
            } else if (!nameRegExp.hasMatch(value)) {
              return context.locale.pleaseUseOnlyLetters;
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: AppDimensions.large),
        CustomButton(
          backgroundColor: context.theme.inputFieldFillColor,
          onTap: _showDatePicker,
          child: Text(
            widget.dateOfBirth ?? context.locale.dateOfBirth,
            style: widget.dateOfBirth != null
                ? context.themeData.textTheme.headlineMedium?.copyWith(
                    color: context.theme.primaryTextColor,
                    fontWeight: AppFonts.weightRegular,
                  )
                : context.themeData.textTheme.titleLarge?.copyWith(
                    color: context.theme.tertiaryTextColor,
                    height: AppFonts.sizeFactorLarge,
                  ),
          ),
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          formKey: locationFormKey,
          controller: _locationController,
          hintText: context.locale.location,
          validator: (value) {
            if (value!.isEmpty) {
              return context.locale.pleaseEnterYourLocation;
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          formKey: bioFormKey,
          controller: _bioController,
          hintText: context.locale.bio,
          maxLength: AppDimensions.bioMaxLength,
          validator: (value) {
            if (value!.isEmpty) {
              return context.locale.pleaseEnterYourBIO;
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: AppDimensions.large),
        CustomButton(
          text: context.locale.submit,
          onTap: () {
            final validateName = nameFormKey.currentState?.validate() == true;
            final validateUsername =
                usernameFormKey.currentState?.validate() == true;
            final validateLocation =
                locationFormKey.currentState?.validate() == true;
            final validateBio = bioFormKey.currentState?.validate() == true;
            final validateDateOfBirth = widget.dateOfBirth != null;
            if (validateName &&
                validateUsername &&
                validateLocation &&
                validateBio &&
                validateDateOfBirth) {
              widget.cubit.updateProfile(
                profile: ProfileModel(
                  username: _usernameController.text.trim(),
                  fullName: _fullNameController.text.trim(),
                  dateOfBirth: widget.dateOfBirth,
                  location: _locationController.text.trim(),
                  bio: _bioController.text.trim(),
                  avatarUrl: widget.avatarUrl,
                  email: widget.email,
                  phoneNumber: widget.phoneNumber,
                ),
                onError: (error) => context.showErrorSnackbar(error),
                onSuccess: widget.cubit.navigateToMainPage,
              );
            }
          },
        ),
      ],
    );
  }
}
