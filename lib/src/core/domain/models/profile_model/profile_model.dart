// ignore_for_file: avoid_redundant_argument_values

import 'package:velocio/src/core/domain/models/domain_object.dart';

final class ProfileModel extends DomainObject {
  final String? updatedAt;
  final String? username;
  final String? fullName;
  final String? avatarUrl;
  final String? dateOfBirth;
  final String? location;
  final String? bio;
  final String? email;
  final String? phoneNumber;
  final bool? isActive;
  final String? lastActive;
  final bool? isProfileCompleted;

  const ProfileModel({
    this.isActive = false,
    this.updatedAt,
    this.username,
    this.fullName,
    this.avatarUrl,
    this.dateOfBirth,
    this.location,
    this.bio,
    this.email,
    this.phoneNumber,
    this.lastActive,
    this.isProfileCompleted,
  });

  @override
  List<Object?> get props => [
        isActive,
        updatedAt,
        username,
        fullName,
        avatarUrl,
        dateOfBirth,
        location,
        bio,
        email,
        phoneNumber,
        lastActive,
        isProfileCompleted,
      ];

  @override
  ProfileModel copyWith() {
    return ProfileModel(
      isActive: isActive,
      updatedAt: updatedAt,
      username: username,
      fullName: fullName,
      avatarUrl: avatarUrl,
      dateOfBirth: dateOfBirth,
      location: location,
      bio: bio,
      email: email,
      phoneNumber: phoneNumber,
      lastActive: lastActive,
      isProfileCompleted: isProfileCompleted,
    );
  }

  ProfileModel empty() {
    return const ProfileModel(
      isActive: false,
      updatedAt: null,
      username: '',
      fullName: '',
      avatarUrl: '',
      dateOfBirth: '',
      location: '',
      bio: '',
      email: '',
      phoneNumber: '',
      lastActive: '',
      isProfileCompleted: false,
    );
  }
}
