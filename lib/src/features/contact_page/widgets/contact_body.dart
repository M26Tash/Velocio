// import 'package:contacts_service/contacts_service.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/features/contact_page/cubit/contact_cubit.dart';

class ContactBody extends StatefulWidget {
  final ContactCubit cubit;
  final List<Contact>? contacts;
  const ContactBody({
    required this.cubit,
    required this.contacts,
    super.key,
  });

  @override
  State<ContactBody> createState() => _ContactBodyState();
}

class _ContactBodyState extends State<ContactBody> {
  @override
  void initState() {
    super.initState();

    widget.cubit.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        if (widget.contacts!.isNotEmpty)
          for (final contact in widget.contacts!)
            ListTile(
              title: Text(contact.displayName),
              titleTextStyle:
                  context.themeData.textTheme.headlineMedium?.copyWith(
                color: context.theme.primaryTextColor,
                fontWeight: AppFonts.weightSemiBold,
              ),
              subtitle: contact.phones.isNotEmpty
                  ? Text(contact.phones.first.number)
                  : const Text('Unavailable'),
              subtitleTextStyle:
                  context.themeData.textTheme.headlineSmall?.copyWith(
                color: context.theme.secondaryTextColor,
                fontWeight: AppFonts.weightRegular,
              ),
            ),
      ],
    );
  }
}
