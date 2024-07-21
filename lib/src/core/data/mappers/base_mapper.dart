import 'package:velocio/src/core/domain/models/domain_object.dart';

abstract interface class BaseMapper<T extends DomainObject> {
  Map<String, dynamic> toJson(T data);
  T fromJson(Map<String, dynamic> json);
}
