// import 'package:contacts_service/contacts_service.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';
import 'package:velocio/src/features/contact_page/cubit/contact_cubit.dart';
import 'package:velocio/src/features/main_page/widgets/contacts_item.dart';

class ContactBody extends StatefulWidget {
  final ContactCubit cubit;
  final List<Contact>? contacts;
  final List<ProfileModel>? userContacts;
  final List<String> contactFilter;
  const ContactBody({
    required this.cubit,
    required this.contacts,
    required this.userContacts,
    required this.contactFilter,
    super.key,
  });

  @override
  State<ContactBody> createState() => _ContactBodyState();
}

class _ContactBodyState extends State<ContactBody> {
  @override
  void initState() {
    super.initState();

    if (widget.contactFilter.isNotEmpty) {
      widget.cubit.getVelocioUserPhoneNumber(
        contactFilter: widget.contactFilter,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        if (widget.contacts!.isNotEmpty && widget.userContacts!.isNotEmpty)
          for (final userContact in widget.userContacts!)
            ContactItem(
              avatarUrl: userContact.avatarUrl,
              contactName: userContact.fullName ?? '',
              subtitle: userContact.phoneNumber,
              onTap: () {},
            ),
        // ListTile(
        //   title: Text(userContact.fullName ?? 'NOT'),
        //   titleTextStyle:
        //       context.themeData.textTheme.headlineMedium?.copyWith(
        //     color: context.theme.primaryTextColor,
        //     fontWeight: AppFonts.weightSemiBold,
        //   ),
        //   subtitle: userContact.phoneNumber!.isNotEmpty
        //       ? Text(userContact.phoneNumber!)
        //       : const Text('Unavailable'),
        //   subtitleTextStyle:
        //       context.themeData.textTheme.headlineSmall?.copyWith(
        //     color: context.theme.secondaryTextColor,
        //     fontWeight: AppFonts.weightRegular,
        //   ),
        // ),
      ],
    );
  }
}
