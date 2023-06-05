import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:waste_food_management/src/core/entities/user_model.dart';
import 'package:waste_food_management/src/core/entities/user_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/parameters/params.dart';



abstract class AuthRepository{
  Future<Either<Failure, UserCredential>> registration({required RegistrationParams params});
  Future<Either<Failure, ConfirmationResult>> sendOtp({required String phoneNumber});
  Future<Either<Failure, bool>> verifyPhoneNumber({required VerifyParams params});
  Future<Either<Failure, UserCredential>> loginEmailAndPassword({required LoginParams params});
  Future<Either<Failure, UserCredential>> loginWithGoogle();
  Future<Either<Failure, bool>> logout();
}

class VerifyParams extends Equatable{
  final ConfirmationResult confirmationResult;
  final String smsCode;

  const VerifyParams({required this.confirmationResult, required this.smsCode});

  @override
  List<Object?> get props => [confirmationResult, smsCode];

}