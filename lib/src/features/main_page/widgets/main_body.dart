import 'package:flutter/material.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/widgets/input_field/input_field.dart';
import 'package:velocio/src/core/domain/models/chat_model/chat_model.dart';
import 'package:velocio/src/features/main_page/cubit/main_cubit.dart';
import 'package:velocio/src/features/main_page/widgets/contacts_item.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class MainBody extends StatefulWidget {
  final MainCubit cubit;

  final List<ChatModel> chats;
  const MainBody({
    required this.cubit,
    required this.chats,
    super.key,
  });

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
            onTap: () {},
            onChanged: (value) {},
          ),
          if (widget.chats.isNotEmpty)
            Column(
              children: [
                const SizedBox(height: AppDimensions.large),
                for (final chat in widget.chats)
                  ContactItem(
                    avatarUrl: chat.profile?.avatarUrl,
                    contactName: chat.profile?.fullName ?? '',
                    contactLastMessage: chat.lastMessage,
                    contactLastMessageDate: chat.createdAt,
                    isActive: chat.profile!.isActive,
                    onTap: () {
                      widget.cubit.navigateToChatPage(
                        chatId: chat.chatId,
                        receiverName: chat.profile?.fullName ?? '',
                        profile: chat.profile,
                      );
                    },
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
