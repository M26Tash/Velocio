import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/extensions/snackbar_context_extension.dart';
import 'package:velocio/src/common/widgets/custom_button/custom_button.dart';
import 'package:velocio/src/common/widgets/custom_vector/custom_vector.dart';
import 'package:velocio/src/common/widgets/input_field/input_field.dart';
import 'package:velocio/src/common/widgets/option_tile/option_tile.dart';
import 'package:velocio/src/common/widgets/support_methods/support_methods.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';
import 'package:velocio/src/features/my_account_page/cubit/my_account_cubit.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class MyAccountBody extends StatefulWidget {
  final MyAccountCubit cubit;
  final ProfileModel profileModel;
  // final String? avatarUrl;
  const MyAccountBody({
    required this.cubit,
    required this.profileModel,
    super.key,
  });

  @override
  State<MyAccountBody> createState() => _MyAccountBodyState();
}

class _MyAccountBodyState extends State<MyAccountBody> {
  late final TextEditingController _fullNameController;
  late final TextEditingController _usernameController;
  late final TextEditingController _locationController;
  late final TextEditingController _bioController;

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) => widget.cubit.getAvatarUrl(),
    // );

    _fullNameController = TextEditingController();
    _usernameController = TextEditingController();
    _locationController = TextEditingController();
    _bioController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _fullNameController.dispose();
    _usernameController.dispose();
    _locationController.dispose();
    _bioController.dispose();
  }

  Future<void> showBottomSheet({
    required String sheetTitle,
    required TextEditingController controller,
    required VoidCallback onTap,
  }) {
    return SupportMethods.showBottomSheet(
      context: context,
      sheetTitle: sheetTitle,
      child: Column(
        children: [
          const SizedBox(height: AppDimensions.large),
          InputField(
            controller: controller,
          ),
          const SizedBox(height: AppDimensions.large),
          CustomButton(
            text: context.locale.submit,
            onTap: onTap,
          ),
          const SizedBox(height: AppDimensions.large),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        CircleAvatar(
          backgroundColor: context.theme.secondaryColor,
          radius: 70,
          backgroundImage: widget.profileModel.avatarUrl != null
              ? NetworkImage(widget.profileModel.avatarUrl!)
              : null,
          child: widget.profileModel.avatarUrl == null
              ? CustomVector(
                  assetPath: AppAssets.imageIcon,
                  height: 60,
                  color: context.theme.primaryIconColor,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(height: AppDimensions.large),
        OptionTile(
          assetPath: AppAssets.imageIcon,
          option: context.locale.pickImage,
          onTap: widget.cubit.pickImage,
        ),
        OptionTile(
          assetPath: AppAssets.myAccountIcon,
          option: context.locale.editFullName,
          onTap: () => showBottomSheet(
            sheetTitle: context.locale.fullName,
            controller: _fullNameController,
            onTap: () {
              if (_fullNameController.text.isNotEmpty) {
                widget.cubit.updateProfile(
                  profile: ProfileModel(
                    fullName: _fullNameController.text,
                  ),
                  onError: (error) => context.showErrorSnackbar(error),
                  onSuccess: () {},
                );
              }
            },
          ),
        ),
        OptionTile(
          assetPath: AppAssets.editIcon,
          option: context.locale.editUsername,
          onTap: () => showBottomSheet(
            sheetTitle: context.locale.username,
            controller: _usernameController,
            onTap: () {
              if (_usernameController.text.isNotEmpty) {
                widget.cubit.updateProfile(
                  profile: ProfileModel(
                    username: _usernameController.text,
                  ),
                  onError: (error) => context.showErrorSnackbar(error),
                  onSuccess: () {},
                );
              }
            },
          ),
        ),
        OptionTile(
          assetPath: AppAssets.calendarIcon,
          option: context.locale.editDateOfBirth,
          onTap: widget.cubit.pickImage,
        ),
        OptionTile(
          assetPath: AppAssets.locationIcon,
          option: context.locale.location,
          onTap: () => showBottomSheet(
            sheetTitle: context.locale.location,
            controller: _locationController,
            onTap: () {
              if (_locationController.text.isNotEmpty) {
                widget.cubit.updateProfile(
                  profile: ProfileModel(
                    fullName: _locationController.text,
                  ),
                  onError: (error) => context.showErrorSnackbar(error),
                  onSuccess: () {},
                );
              }
            },
          ),
        ),
        OptionTile(
          assetPath: AppAssets.bioEditIcon,
          option: context.locale.editBIO,
          onTap: () => showBottomSheet(
            sheetTitle: context.locale.bio,
            controller: _bioController,
            onTap: () {
              if (_bioController.text.isNotEmpty) {
                widget.cubit.updateProfile(
                  profile: ProfileModel(
                    fullName: _bioController.text,
                  ),
                  onError: (error) => context.showErrorSnackbar(error),
                  onSuccess: () {},
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
