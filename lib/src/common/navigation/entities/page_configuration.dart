import 'package:equatable/equatable.dart';
import 'package:velocio/src/common/navigation/entities/page_arguments.dart';

class PageConfiguration extends Equatable {
  final String path;
  final PageArguments? args;
  final Map<String, String>? pathParameters;

  @override
  List<Object?> get props => [
        path,
        args,
      ];

  const PageConfiguration({
    required this.path,
    this.args,
    this.pathParameters,
  });

  PageConfiguration copyWith({
    String? path,
    PageArguments? args,
  }) {
    return PageConfiguration(
      path: path ?? this.path,
      args: args ?? this.args,
    );
  }
}
