library shared_utils;

import 'package:equatable/equatable.dart';

import 'usecase.dart';

/// result wrapper for a [UseCase] execution
abstract class UseCaseResult<T> extends Equatable {
  const UseCaseResult();

  /// success
  factory UseCaseResult.success(T data) => UseCaseResultSuccess<T>.create(data);

  /// error/failure
  factory UseCaseResult.error(String cause) =>
      UseCaseResultError<T>.create(cause);
}

/// success result wrapper
class UseCaseResultSuccess<T> extends UseCaseResult<T> {
  const UseCaseResultSuccess._(this.value) : super();

  factory UseCaseResultSuccess.create(T data) => UseCaseResultSuccess._(data);
  final T value;

  @override
  List<Object> get props => [value as Object];
}

/// error result wrapper
class UseCaseResultError<E> extends UseCaseResult<E> {
  const UseCaseResultError._(this.cause) : super();

  factory UseCaseResultError.create(String cause) =>
      UseCaseResultError._(cause);
  final String cause;

  @override
  List<Object> get props => [cause];
}
