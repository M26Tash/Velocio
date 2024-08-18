// ignore_for_file: use_if_null_to_convert_nulls_to_bools

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:velocio/src/common/cubit_scope/cubit_scope.dart';
import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/common/navigation/entities/go_router_extension.dart';
import 'package:velocio/src/common/navigation/entities/page_arguments.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/utils/extensions/string_extension.dart';
import 'package:velocio/src/common/widgets/base_page/base_page.dart';
import 'package:velocio/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:velocio/src/common/widgets/custom_vector/custom_vector.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';
import 'package:velocio/src/features/chat_page/cubit/chat_cubit.dart';
import 'package:velocio/src/features/chat_page/widgets/chat_body.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class ChatPage extends StatefulWidget {
  final String? chatId;
  final String? receiverName;
  final ProfileModel? profile;
  const ChatPage({
    required this.chatId,
    required this.receiverName,
    required this.profile,
    super.key,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatCubit = i.get<ChatCubit>();

  @override
  void initState() {
    super.initState();

    chatCubit.getMessages(
      chatId: widget.chatId!,
    );
  }

  void _listener(BuildContext context, ChatState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(ChatState prev, ChatState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<ChatCubit>(
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<ChatCubit>(context);

          if (state.messages == null) {
            return BasePage(
              body: Center(
                child: CircularProgressIndicator(
                  color: context.theme.mainColor,
                ),
              ),
            );
          }
          return BasePage(
            resizeToAvoidBottomInset: true,
            appBar: CustomAppBar(
              isLeading: true,
              icon: Icons.arrow_back_ios,
              onLeadingPressed: cubit.onBackTap,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: context.theme.secondaryColor,
                    radius: 20,
                    backgroundImage: widget.profile?.avatarUrl != null
                        ? NetworkImage(widget.profile!.avatarUrl!)
                        : null,
                    child: widget.profile?.avatarUrl == null
                        ? CustomVector(
                            assetPath: AppAssets.imageIcon,
                            height: 60,
                            color: context.theme.primaryIconColor,
                          )
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(width: AppDimensions.medium),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.profile!.fullName ?? '',
                        style: context.themeData.textTheme.headlineMedium
                            ?.copyWith(
                          color: context.theme.primaryTextColor,
                          fontWeight: AppFonts.weightMedium,
                        ),
                      ),
                      if (widget.profile?.isActive == true)
                        Text(
                          'online',
                          style: context.themeData.textTheme.headlineSmall
                              ?.copyWith(
                            color: context.theme.quaternaryTextColor,
                            fontWeight: AppFonts.weightMedium,
                          ),
                        ),
                      if (widget.profile?.isActive == false)
                        Text(
                          timeago.format(
                            widget.profile!.lastActive!.toDateTime(),
                            locale: context.locale.localeName,
                          ),
                          style: context.themeData.textTheme.headlineSmall
                              ?.copyWith(
                            color: context.theme.secondaryTextColor,
                            fontWeight: AppFonts.weightMedium,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            body: ChatBody(
              cubit: cubit,
              messages: state.messages,
              isButtonActive: state.isButtonActive,
              chatId: widget.chatId!,
            ),
          );
        },
      ),
    );
  }
}

final class ChatArguments extends PageArguments {
  final String? chatId;
  final String? receiverName;
  final ProfileModel? profile;
  @override
  List<Object?> get props => [
        chatId,
        receiverName,
        profile,
      ];

  ChatArguments({
    required this.chatId,
    required this.receiverName,
    required this.profile,
  });
}

// TEMPORARY ID
abstract final class USERSID {
  static const String sender1 = '81831e54-a5d3-4f69-aa00-0f14a5f82735';
  static const String sender2 = '27a71baa-4429-4b3f-a885-8a25149517fd';
  static const String receiver1 = '27a71baa-4429-4b3f-a885-8a25149517fd';
  static const String receiver2 = '81831e54-a5d3-4f69-aa00-0f14a5f82735';
}
