import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
abstract class AuthException<T> with _$AuthException {
  const factory AuthException.invalidEmail({required T exceptionValue}) =
      InvalidEmail;

  const factory AuthException.shortPassword({required T exceptionValue}) =
      ShortPassword;
}

@freezed
abstract class ValueException<T> with _$ValueException {
  const factory ValueException.serverException({required T exceptionValue}) =
      serverException;
}

class ServerException extends Equatable implements Exception {
  final String message;
  const ServerException({required this.message});

  @override
  List<Object?> get props => [message];
}
