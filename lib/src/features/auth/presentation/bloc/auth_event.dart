part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}


class RegistrationEvent extends AuthEvent{
  final RegistrationParams params;
  const RegistrationEvent({required this.params});

  @override
  List<Object?> get props => [params];
}

class LoginWithEmailAndPasswordEvent extends AuthEvent{
  final LoginParams params;
  const LoginWithEmailAndPasswordEvent({required this.params});

  @override
  List<Object?> get props => [params];
}

class SendOtpEvent extends AuthEvent{
  final String phoneNumber;
  const SendOtpEvent({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}

class VerifyPhoneEvent extends AuthEvent{
  final ConfirmationResult confirmationResult;
  final String smsCode;
  const VerifyPhoneEvent({required this.confirmationResult, required this.smsCode});

  @override
  List<Object?> get props => [confirmationResult, smsCode];
}

// class LogoutEvent extends AuthEvent{
//
//   @override
//   List<Object?> get props => [];
// }
