import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class SendOtp implements UseCase<ConfirmationResult, String> {
  final AuthRepository authRepository;

  SendOtp({required this.authRepository});

  @override
  Future<Either<Failure, ConfirmationResult>> call(String phoneNumber) async {
    return authRepository.sendOtp(phoneNumber: phoneNumber);
  }
}
