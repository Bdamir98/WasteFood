import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class LoginWithGoogle implements UseCase<UserCredential, NoParams> {
  final AuthRepository authRepository;

  LoginWithGoogle({required this.authRepository});

  @override
  Future<Either<Failure, UserCredential>> call(NoParams noParams) async {
    return authRepository.loginWithGoogle();
  }
}
