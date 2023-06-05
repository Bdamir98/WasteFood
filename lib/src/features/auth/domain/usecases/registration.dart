import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:waste_food_management/src/core/entities/user_model.dart';
import 'package:waste_food_management/src/core/entities/user_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/parameters/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class Registration implements UseCase<UserCredential, RegistrationParams> {
  final AuthRepository authRepository;

  Registration({required this.authRepository});

  @override
  Future<Either<Failure, UserCredential>> call(RegistrationParams params) async {
    return authRepository.registration(params: params);
  }
}
