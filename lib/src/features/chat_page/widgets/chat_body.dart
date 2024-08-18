import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/utils/extensions/context_extension.dart';
import 'package:velocio/src/common/utils/extensions/string_extension.dart';
import 'package:velocio/src/common/widgets/custom_vector_button/custom_vector_button.dart';
import 'package:velocio/src/common/widgets/input_field/input_field.dart';
import 'package:velocio/src/core/domain/models/message_model/message_model.dart';
import 'package:velocio/src/features/chat_page/cubit/chat_cubit.dart';

class ChatBody extends StatefulWidget {
  final ChatCubit cubit;
  final List<MessageModel?>? messages;
  final bool isButtonActive;
  final String chatId;
  const ChatBody({
    required this.cubit,
    required this.messages,
    required this.isButtonActive,
    required this.chatId,
    super.key,
  });

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  late final TextEditingController messageController;
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    messageController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    messageController.dispose();
  }

  Map<String, List<MessageModel>> groupItemsByDate(List<MessageModel> items) {
    return groupBy(
      items,
      (MessageModel item) => item.createdAt.dateFormat(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.messages!.isEmpty) return const SizedBox.shrink();

    final nonNullMessages = widget.messages!.whereType<MessageModel>().toList();

    final groupedItems = groupItemsByDate(nonNullMessages);

    return Column(
      children: [
        if (widget.messages!.isNotEmpty)
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                controller: scrollController,
                reverse: true,
                shrinkWrap: true,
                itemCount: groupedItems.length,
                itemBuilder: (context, index) {
                  final date = groupedItems.keys.elementAt(index);
                  final itemsInDate = groupedItems[date];

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(AppDimensions.medium),
                            decoration: BoxDecoration(
                              color: context.theme.tertiaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  AppDimensions.large,
                                ),
                              ),
                            ),
                            child: Text(
                              date,
                              style: context.themeData.textTheme.headlineMedium
                                  ?.copyWith(
                                color: context.theme.primaryTextColor,
                                fontWeight: AppFonts.weightRegular,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: itemsInDate?.length,
                        itemBuilder: (BuildContext context, int index) {
                          final message = itemsInDate![index];
                          final isSenderMessage =
                              message.senderId == widget.cubit.userId;

                          return Message(
                            messageModel: message,
                            isSenderMessage: isSenderMessage,
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        if (widget.messages!.isEmpty) const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.extraLarge,
            horizontal: AppDimensions.large,
          ),
          child: Row(
            children: [
              Expanded(
                child: InputField(
                  controller: messageController,
                  suffixIcon: widget.isButtonActive == true
                      ? CustomVectorButton(
                          assetPath: AppAssets.sendIcon,
                          onPressed: () {
                            scrollController.animateTo(
                              AppDimensions.none,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );

                            widget.cubit.sendMessage(
                              chatId: widget.chatId,
                              senderId: widget.cubit.userId!,
                              content: messageController.text.trim(),
                            );

                            messageController.clear();
                          },
                        )
                      : const SizedBox.shrink(),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      widget.cubit.updateActiveButton(isButtonActive: true);
                    } else {
                      widget.cubit.updateActiveButton(isButtonActive: false);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Message extends StatelessWidget {
  final MessageModel messageModel;
  final bool isSenderMessage;

  const Message({
    required this.messageModel,
    required this.isSenderMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment:
          isSenderMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: context.deviceWidth - AppDimensions.maxMessageArea,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.large,
                  vertical: AppDimensions.medium,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.medium,
                  vertical: AppDimensions.small,
                ),
                decoration: BoxDecoration(
                  color: isSenderMessage
                      ? context.theme.mainColor
                      : context.theme.tertiaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      AppDimensions.large,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      messageModel.content,
                      style:
                          context.themeData.textTheme.headlineMedium?.copyWith(
                        color: context.theme.primaryTextColor,
                        fontWeight: AppFonts.weightRegular,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.small),
                    Text(
                      messageModel.createdAt.formatHHmm(),
                      style: context.themeData.textTheme.titleSmall?.copyWith(
                        color: context.theme.primaryTextColor,
                        fontWeight: AppFonts.weightRegular,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
