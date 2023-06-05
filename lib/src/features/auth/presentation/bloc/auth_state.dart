part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class LoggedIn extends AuthState {
  @override
  List<Object> get props => [];
}

class LoggedOut extends AuthState {
  @override
  List<Object> get props => [];
}

class RegistrationLoadingState extends AuthState {
  final bool isLoading;

  const RegistrationLoadingState({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class LoginLoadingState extends AuthState {
  final bool isLoading;

  const LoginLoadingState({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class InvalidEmailState extends AuthState {
  final String message;

  const InvalidEmailState({required this.message});

  @override
  List<Object?> get props => [message];
}

class InvalidPasswordState extends AuthState {
  final String message;

  const InvalidPasswordState({required this.message});

  @override
  List<Object?> get props => [message];
}

class RegistrationSuccessState extends AuthState {
  final String message;

  const RegistrationSuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}

class LoginSuccessState extends AuthState {
  final String message;

  const LoginSuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}

class RegistrationFailedState extends AuthState {
  final String message;

  const RegistrationFailedState({required this.message});

  @override
  List<Object?> get props => [message];
}

class LoginFailedState extends AuthState {
  final String message;

  const LoginFailedState({required this.message});

  @override
  List<Object?> get props => [message];
}

class SendOtpState extends AuthState {
  final ConfirmationResult confirmationResult;

  const SendOtpState({required this.confirmationResult});

  @override
  List<Object?> get props => [confirmationResult];
}

class VerifiedPhoneNumberState extends AuthState {
  final bool isVerified;

  const VerifiedPhoneNumberState({required this.isVerified});

  @override
  List<Object?> get props => [isVerified];
}

class LogoutState extends AuthState {
  @override
  List<Object> get props => [];
}
