import 'package:flutter/material.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/widgets/custom_vector_button/custom_vector_button.dart';
import 'package:velocio/src/common/widgets/input_field/input_field.dart';
import 'package:velocio/src/features/chat_page/cubit/chat_cubit.dart';
import 'package:velocio/src/features/chat_page/pages/chat_page.dart';

class ChatBody extends StatefulWidget {
  final ChatCubit cubit;
  final List<Map<String, dynamic>?>? messages;
  const ChatBody({
    required this.cubit,
    required this.messages,
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.topCenter,
            child: ListView.builder(
              controller: scrollController,
              reverse: true,
              shrinkWrap: true,
              itemCount: widget.messages?.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(
                  vertical: AppDimensions.large,
                ),
                padding: const EdgeInsets.all(AppDimensions.large),
                // TESTING
                color: widget.messages?[index]?['sender_id'] == USERSID.sender1
                    ? Colors.red
                    : Colors.green,
                child: Text(
                  widget.messages?[index]?['content'] ?? 'NOT FOUND',
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            const Expanded(
              child: InputField(),
            ),
            CustomVectorButton(
              assetPath: AppAssets.addIcon,
              onPressed: () {
                scrollController.animateTo(
                  AppDimensions.none,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
