part of 'contact_cubit.dart';

final class ContactState extends Equatable {
  final CustomRoute route;
  final List<Contact>? contacts;
  @override
  List<Object?> get props => [
        route,
        contacts,
      ];

  const ContactState({
    required this.route,
    required this.contacts,
  });

  ContactState copyWith({
    CustomRoute? route,
    List<Contact>? contacts,
  }) {
    return ContactState(
      route: route ?? this.route,
      contacts: contacts ?? this.contacts,
    );
  }
}
