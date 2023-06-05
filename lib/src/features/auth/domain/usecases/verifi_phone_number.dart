import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class VerifyPhoneNumber implements UseCase<bool, VerifyParams> {
  final AuthRepository authRepository;

  VerifyPhoneNumber({required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(VerifyParams params) async {
    return authRepository.verifyPhoneNumber(params: params);
  }
}
