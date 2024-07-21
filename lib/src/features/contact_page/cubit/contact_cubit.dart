import 'dart:async';

// import 'package:contacts_service/contacts_service.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/navigation/entities/custom_route.dart';
import 'package:velocio/src/core/domain/interactors/settings_interactor.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  final SettingsInteractor _settingsInteractor;
  ContactCubit(this._settingsInteractor)
      : super(
          const ContactState(
            route: CustomRoute(null, null),
            contacts: [],
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<Contact>?>? _contactSubscription;

  @override
  Future<void> close() {
    _contactSubscription?.cancel();
    _contactSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _contactSubscription?.cancel();
    _contactSubscription =
        _settingsInteractor.contactStream.listen(_onNewContacts);
  }

  Future<void> getContacts() async {
    return _settingsInteractor.getContacts();
  }

  void _onNewContacts(List<Contact>? contacts) {
    
    contacts?.removeWhere(
      (contact) => contact.phones.isEmpty,
    );

    emit(
      state.copyWith(
        contacts: contacts,
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
