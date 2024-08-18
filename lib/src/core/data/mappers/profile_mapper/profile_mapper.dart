// ignore_for_file: lines_longer_than_80_chars, curly_braces_in_flow_control_structures

import 'package:velocio/src/core/data/mappers/base_mapper.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';

final class ProfileMapper implements BaseMapper<ProfileModel> {
  @override
  Map<String, dynamic> toJson(ProfileModel data) {
    final json = <String, dynamic>{};

    if (data.updatedAt != null) json[_Fields.updatedAt] = data.updatedAt;
    if (data.username != null) json[_Fields.username] = data.username;
    if (data.fullName != null) json[_Fields.fullName] = data.fullName;
    if (data.dateOfBirth != null) json[_Fields.dateOfBirth] = data.dateOfBirth;
    if (data.location != null) json[_Fields.location] = data.location;
    if (data.bio != null) json[_Fields.bio] = data.bio;
    if (data.avatarUrl != null) json[_Fields.avatarUrl] = data.avatarUrl;
    if (data.email != null) json[_Fields.email] = data.email;
    if (data.phoneNumber != null) json[_Fields.phoneNumber] = data.phoneNumber;
    if (data.isProfileCompleted != null)
      json[_Fields.isProfileCompleted] = data.isProfileCompleted;

    return json;
  }

  @override
  ProfileModel fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      isActive: json[_Fields.isActive],
      updatedAt: json[_Fields.updatedAt],
      username: json[_Fields.username],
      fullName: json[_Fields.fullName],
      dateOfBirth: json[_Fields.dateOfBirth],
      location: json[_Fields.location],
      bio: json[_Fields.bio],
      avatarUrl: json[_Fields.avatarUrl],
      email: json[_Fields.email],
      phoneNumber: json[_Fields.phoneNumber],
      lastActive: json[_Fields.lastActive],
      isProfileCompleted: json[_Fields.isProfileCompleted],
    );
  }
}

abstract final class _Fields {
  static const String isActive = 'is_active';
  static const String updatedAt = 'updated_at';
  static const String username = 'username';
  static const String fullName = 'full_name';
  static const String dateOfBirth = 'date_of_birth';
  static const String location = 'location';
  static const String bio = 'bio';
  static const String avatarUrl = 'avatar_url';
  static const String email = 'email';
  static const String phoneNumber = 'phone_number';
  static const String lastActive = 'last_active';
  static const String isProfileCompleted = 'is_profile_completed';
}
