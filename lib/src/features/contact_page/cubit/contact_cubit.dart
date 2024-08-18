import 'dart:async';

// import 'package:contacts_service/contacts_service.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/navigation/entities/custom_route.dart';
import 'package:velocio/src/core/domain/interactors/data_interactor.dart';
import 'package:velocio/src/core/domain/interactors/settings_interactor.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  final SettingsInteractor _settingsInteractor;
  final DataInteractor _dataInteractor;
  ContactCubit(
    this._settingsInteractor,
    this._dataInteractor,
  ) : super(
          const ContactState(
            route: CustomRoute(null, null),
            contacts: [],
            userContacts: [],
            contactFilter: [],
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<Contact>?>? _contactSubscription;
  StreamSubscription<List<ProfileModel>?>? _velocioUsersSubscription;

  @override
  Future<void> close() {
    _contactSubscription?.cancel();
    _contactSubscription = null;

    _velocioUsersSubscription?.cancel();
    _velocioUsersSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _contactSubscription?.cancel();
    _contactSubscription =
        _settingsInteractor.contactStream.listen(_onNewContacts);

    _velocioUsersSubscription?.cancel();
    _velocioUsersSubscription =
        _dataInteractor.velocioUsersStream.listen(_onNewUserContacts);
  }

  Future<void> getContacts() async {
    return _settingsInteractor.getContacts();
  }

  Future<void> getVelocioUserPhoneNumber({
    required List<String> contactFilter,
  }) async {
    return _dataInteractor.getVelocioUserPhoneNumber(
      contactFilter: state.contactFilter,
    );
  }

  void _onNewContacts(List<Contact>? contacts) {
    contacts?.removeWhere(
      (contact) => contact.phones.isEmpty,
    );

    final list = <String>[];

    for (final contact in contacts!) {
      list.add(contact.phones.first.number);
    }

    emit(
      state.copyWith(
        contacts: contacts,
        contactFilter: list,
      ),
    );
  }

  void _onNewUserContacts(List<ProfileModel>? contacts) {
    emit(
      state.copyWith(
        userContacts: contacts,
      ),
    );
  }

  void onBackTap() {
    emit(
      state.copyWith(
        route: const CustomRoute.pop(),
      ),
    );

    _resetRoute();
  }

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }
}
