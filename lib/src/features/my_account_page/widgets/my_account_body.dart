import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/widgets/custom_vector/custom_vector.dart';
import 'package:velocio/src/common/widgets/option_tile/option_tile.dart';
import 'package:velocio/src/features/my_account_page/cubit/my_account_cubit.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class MyAccountBody extends StatefulWidget {
  final MyAccountCubit cubit;
  final String? avatarUrl;
  const MyAccountBody({
    required this.cubit,
    required this.avatarUrl,
    super.key,
  });

  @override
  State<MyAccountBody> createState() => _MyAccountBodyState();
}

class _MyAccountBodyState extends State<MyAccountBody> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => widget.cubit.getAvatarUrl(),
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
          backgroundImage:
              widget.avatarUrl != null ? NetworkImage(widget.avatarUrl!) : null,
          child: widget.avatarUrl == null
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
          onTap: widget.cubit.pickImage,
        ),
        OptionTile(
          assetPath: AppAssets.editIcon,
          option: context.locale.editUsername,
          onTap: widget.cubit.pickImage,
        ),
        OptionTile(
          assetPath: AppAssets.calendarIcon,
          option: context.locale.editDateOfBirth,
          onTap: widget.cubit.pickImage,
        ),
        OptionTile(
          assetPath: AppAssets.locationIcon,
          option: context.locale.location,
          onTap: widget.cubit.pickImage,
        ),
        OptionTile(
          assetPath: AppAssets.bioEditIcon,
          option: context.locale.editBIO,
          onTap: widget.cubit.pickImage,
        ),
      ],
    );
  }
}
