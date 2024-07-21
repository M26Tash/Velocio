import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/cubit_scope/cubit_scope.dart';
import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/common/navigation/entities/go_router_extension.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/widgets/base_page/base_page.dart';
import 'package:velocio/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:velocio/src/features/chat_page/cubit/chat_cubit.dart';
import 'package:velocio/src/features/chat_page/widgets/chat_body.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatCubit = i.get<ChatCubit>();

  @override
  void initState() {
    super.initState();

    chatCubit.getMessages(
      senderId: USERSID.sender1,
      receiverId: USERSID.receiver1,
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

          return BasePage(
            resizeToAvoidBottomInset: true,
            appBar: CustomAppBar(
              isLeading: true,
              icon: Icons.arrow_back_ios,
              onLeadingPressed: cubit.onBackTap,
              title: Text(
                'Alex Jackson',
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
              centerTitle: true,
            ),
            body: ChatBody(
              cubit: cubit,
              messages: state.messages,
            ),
          );
        },
      ),
    );
  }
}


// TEMPORARY ID
abstract final class USERSID {
  static const String sender1 = '81831e54-a5d3-4f69-aa00-0f14a5f82735';
  static const String sender2 = '27a71baa-4429-4b3f-a885-8a25149517fd';
  static const String receiver1 = '27a71baa-4429-4b3f-a885-8a25149517fd';
  static const String receiver2 = '81831e54-a5d3-4f69-aa00-0f14a5f82735';
}
