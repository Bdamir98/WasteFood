import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:waste_food_management/src/core/entities/user_model.dart';
import 'package:waste_food_management/src/core/entities/user_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/parameters/params.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, UserCredential>> loginEmailAndPassword(
      {required LoginParams params}) async {
    return await _OnBodyCall<UserCredential>()(
      () => authRemoteDataSource.loginWithEmailAndPassword(
        params,
      ),
    );
  }

  @override
  Future<Either<Failure, UserCredential>> loginWithGoogle() async {
    return await _OnBodyCall<UserCredential>()(
      () => authRemoteDataSource.loginWithGoogle(),
    );
  }

  @override
  Future<Either<Failure, UserCredential>> registration(
      {required RegistrationParams params}) async {
    return await _OnBodyCall<UserCredential>()(
      () => authRemoteDataSource.registration(
        params,
      ),
    );
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    return await _OnBodyCall<bool>()(
      () => authRemoteDataSource.logout(),
    );
  }

  @override
  Future<Either<Failure, ConfirmationResult>> sendOtp(
      {required String phoneNumber}) async {
    return await _OnBodyCall<ConfirmationResult>()(
      () => authRemoteDataSource.sendOtp(phoneNumber),
    );
  }

  @override
  Future<Either<Failure, bool>> verifyPhoneNumber(
      {required VerifyParams params}) async {
    return await _OnBodyCall<bool>()(
      () => authRemoteDataSource.verifyPhoneNumber(
          params.confirmationResult, params.smsCode),
    );
  }
}

class _OnBodyCall<T> {
  Future<Either<Failure, T>> call(Function() callable) async {
    try {
      final remoteData = await callable();
      return right(remoteData);
    } on ServerException catch (e) {
      return left(Failure.serverFailure(failureValue: e.message));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(
          const Failure.shortPassword(
            failureValue: 'The password provided is too weak.',
          ),
        );
      } else {
        return left(
          const Failure.emailAlreadyTaken(
            failureValue: 'The account already exists for that email.',
          ),
        );
      }
    } catch (e) {
      return left(const Failure.serverFailure(failureValue: 'Server Failure'));
    }
  }
}
