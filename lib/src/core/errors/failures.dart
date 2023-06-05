import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure<T> with _$Failure {
  const factory Failure.invalidEmail({required T failureValue}) = InvalidEmail;

  const factory Failure.emailAlreadyTaken({required T failureValue}) =
      EmailAlreadyTaken;

  const factory Failure.shortPassword({required T failureValue}) =
      ShortPassword;

  const factory Failure.serverFailure({required T failureValue}) =
      ServerFailure;
}
