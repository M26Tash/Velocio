part of 'contact_cubit.dart';

final class ContactState extends Equatable {
  final CustomRoute route;
  final List<Contact>? contacts;
  final List<ProfileModel>? userContacts;
  final List<String> contactFilter;
  @override
  List<Object?> get props => [
        route,
        contacts,
        userContacts,
        contactFilter,
      ];

  const ContactState({
    required this.route,
    required this.contacts,
    required this.userContacts,
    required this.contactFilter,
  });

  ContactState copyWith({
    CustomRoute? route,
    List<Contact>? contacts,
    List<ProfileModel>? userContacts,
    List<String>? contactFilter,
  }) {
    return ContactState(
      route: route ?? this.route,
      contacts: contacts ?? this.contacts,
      userContacts: userContacts ?? this.userContacts,
      contactFilter: contactFilter ?? this.contactFilter,
    );
  }
}
