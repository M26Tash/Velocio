import 'package:velocio/src/core/domain/models/domain_object.dart';

final class UserStatusModel extends DomainObject {
  final String userId;
  final bool isActive;
  final String lastActive;

  @override
  List<Object?> get props => [
        userId,
        isActive,
        lastActive,
      ];

  const UserStatusModel({
    required this.userId,
    required this.isActive,
    required this.lastActive,
  });

  @override
  UserStatusModel copyWith() {
    return UserStatusModel(
      userId: userId,
      isActive: isActive,
      lastActive: lastActive,
    );
  }
}
