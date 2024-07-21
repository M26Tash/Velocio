// ignore_for_file: avoid_redundant_argument_values

import 'package:velocio/src/core/domain/models/domain_object.dart';

final class ProfileModel extends DomainObject {
  final DateTime? updatedAt;
  final String? username;
  final String? fullName;
  final String? avatarUrl;
  final String? dateOfBirth;
  final String? location;
  final String? bio;
  final String? email;
  final String? phoneNumber;

  const ProfileModel({
    this.updatedAt,
    this.username,
    this.fullName,
    this.avatarUrl,
    this.dateOfBirth,
    this.location,
    this.bio,
    this.email,
    this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        updatedAt,
        username,
        fullName,
        avatarUrl,
        dateOfBirth,
        location,
        bio,
        email,
        phoneNumber,
      ];

  @override
  ProfileModel copyWith({
    DateTime? updatedAt,
  }) {
    return ProfileModel(
      updatedAt: updatedAt ?? this.updatedAt,
      username: username,
      fullName: fullName,
      avatarUrl: avatarUrl,
      dateOfBirth: dateOfBirth,
      location: location,
      bio: bio,
      email: email,
      phoneNumber: phoneNumber,
    );
  }

  ProfileModel empty() {
    return const ProfileModel(
      updatedAt: null,
      username: '',
      fullName: '',
      avatarUrl: '',
      dateOfBirth: '',
      location: '',
      bio: '',
      email: '',
      phoneNumber: '',
    );
  }
}
