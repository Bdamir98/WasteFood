import 'package:dartz/dartz.dart';

import '../../../../core/entities/food_post_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

class GetAllPost implements UseCase<List<FoodPostModel>, NoParams> {
  final HomeRepository homeRepository;

  GetAllPost({required this.homeRepository});

  @override
  Future<Either<Failure, List<FoodPostModel>>> call(NoParams params) {
    return homeRepository.getAllPost();
  }
}
