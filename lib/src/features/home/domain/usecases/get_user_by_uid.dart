import 'package:dartz/dartz.dart';
import 'package:waste_food_management/src/core/entities/user_model.dart';
import 'package:waste_food_management/src/core/entities/user_model.dart';

import '../../../../core/entities/food_post_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/parameters/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

class GetUserByUid implements UseCase<UserModel, String> {
  final HomeRepository homeRepository;

  GetUserByUid({required this.homeRepository});

  @override
  Future<Either<Failure, UserModel>> call(String uid) {
    return homeRepository.getUserByUid(uid);
  }
}
