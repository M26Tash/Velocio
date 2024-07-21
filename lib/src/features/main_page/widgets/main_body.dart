import 'package:flutter/material.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/widgets/input_field/input_field.dart';
import 'package:velocio/src/features/main_page/cubit/main_cubit.dart';
import 'package:velocio/src/features/main_page/widgets/contacts_item.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class MainBody extends StatefulWidget {
  final MainCubit cubit;
  const MainBody({required this.cubit, super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(AppDimensions.large),
        children: [
          InputField(
            controller: _searchController,
            hintText: context.locale.search,
          ),
          const SizedBox(height: AppDimensions.extraLarge),
          ContactItem(
            onTap: widget.cubit.navigateToChatPage,
            contactName: 'Alex Jackson',
            contactLastMessage: 'See you man',
            contactLastMessageDate: '29.05.2024',
          ),
          ContactItem(
            onTap: () {},
            contactName: 'Kalvin Walker',
            contactLastMessage: 'Okay! I got it',
            contactLastMessageDate: '27.05.2024',
          ),
        ],
      ),
    );
  }
}
