import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:waste_food_management/src/core/parameters/params.dart';
import 'package:waste_food_management/src/core/usecases/usecase.dart';
import 'package:waste_food_management/src/core/utils/validators/email_validator.dart';

import '../../../../core/utils/constant.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_with_email_and_password.dart';
import '../../domain/usecases/logout.dart';
import '../../domain/usecases/registration.dart';
import '../../domain/usecases/send_otp.dart';
import '../../domain/usecases/verifi_phone_number.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Registration registration;
  final LoginWithEmailAndPassword loginWithEmailAndPassword;
  final SendOtp sendOtp;
  final VerifyPhoneNumber verifyPhoneNumber;


  User? user;

  AuthBloc({
    required this.registration,
    required this.loginWithEmailAndPassword,
    required this.sendOtp,
    required this.verifyPhoneNumber,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    on<SendOtpEvent>((event, emit) async {
      final sendOtpResponse = await sendOtp(event.phoneNumber);

      await sendOtpResponse.fold(
        (l) async {
          emit(RegistrationFailedState(message: l.failureValue));
        },
        (confirmationResult) async {
          emit(SendOtpState(confirmationResult: confirmationResult));
        },
      );
    });

    on<VerifyPhoneEvent>((event, emit) async {
      final verifyResponse = await verifyPhoneNumber(
        VerifyParams(
          confirmationResult: event.confirmationResult,
          smsCode: event.smsCode,
        ),
      );

      await verifyResponse.fold(
        (l) async {
          emit(RegistrationFailedState(message: l.failureValue));
        },
        (isVerified) async {
          emit(VerifiedPhoneNumberState(isVerified: isVerified));
        },
      );
    });

    on<RegistrationEvent>((event, emit) async {
      emit(const RegistrationLoadingState(isLoading: true));
      final emailValidator = EmailValidator(emailStr: event.params.email);

      if (!emailValidator.validate()) {
        emit(const InvalidEmailState(message: 'Invalid email'));
        return;
      }

      if (event.params.password.length < 6) {
        emit(const InvalidPasswordState(message: 'Invalid password'));
        return;
      }

      final response = await registration(event.params);

      await response.fold(
        (l) async {
          emit(const RegistrationLoadingState(isLoading: false));

          emit(RegistrationFailedState(message: l.failureValue));
        },
        (r) async {
          user = r.user;
          emit(const RegistrationSuccessState(message: 'Registration success'));
          emit(LoggedIn());
        },
      );
    });

    on<LoginWithEmailAndPasswordEvent>((event, emit) async {
      emit(const LoginLoadingState(isLoading: true));

      final response = await loginWithEmailAndPassword(event.params);

      await response.fold(
        (l) async {
          emit(LoginFailedState(message: l.failureValue));
        },
        (r) async {
          user = r.user;

          emit(const LoginSuccessState(message: 'Login success'));

          emit(LoggedIn());
        },
      );
    });

    // on<LogoutEvent>((event, emit) async {
    //   var response = await logout(NoParams());
    //
    //   await response.fold(
    //     (l) async{
    //       emit(LoginFailedState(message: l.failureValue));
    //     },
    //     (r) async{
    //       user = null;
    //       emit(LogoutState());
    //     },
    //   );
    // });
  }
}
