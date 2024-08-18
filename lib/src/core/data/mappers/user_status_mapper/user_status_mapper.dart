import 'package:velocio/src/core/data/mappers/base_mapper.dart';
import 'package:velocio/src/core/domain/models/user_status_model/user_status_model.dart';

final class UserStatusMapper implements BaseMapper<UserStatusModel> {
  @override
  Map<String, dynamic> toJson(UserStatusModel data) {
    return {
      _Fields.userId: data.userId,
      _Fields.isActive: data.isActive,
      _Fields.lastActive: data.lastActive,
    };
  }

  @override
  UserStatusModel fromJson(Map<String, dynamic> json) {
    return UserStatusModel(
      userId: json[_Fields.userId],
      isActive: json[_Fields.isActive],
      lastActive: json[_Fields.lastActive],
    );
  }
}

abstract final class _Fields {
  static const userId = 'user_id';
  static const isActive = 'is_active';
  static const lastActive = 'last_active';
}
