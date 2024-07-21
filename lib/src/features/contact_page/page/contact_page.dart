import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/cubit_scope/cubit_scope.dart';
import 'package:velocio/src/common/navigation/entities/go_router_extension.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/widgets/base_page/base_page.dart';
import 'package:velocio/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:velocio/src/features/contact_page/cubit/contact_cubit.dart';
import 'package:velocio/src/features/contact_page/widgets/contact_body.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  void _listener(BuildContext context, ContactState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(ContactState prev, ContactState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<ContactCubit>(
      child: BlocConsumer<ContactCubit, ContactState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<ContactCubit>(context);
          return BasePage(
            appBar: CustomAppBar(
              isLeading: true,
              icon: Icons.arrow_back_ios,
              onLeadingPressed: cubit.onBackTap,
              title: Text(
                context.locale.contacts,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
              centerTitle: true,
            ),
            body: ContactBody(
              cubit: cubit,
              contacts: state.contacts,
            ),
          );
        },
      ),
    );
  }
}
