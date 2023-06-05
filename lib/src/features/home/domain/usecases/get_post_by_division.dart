import 'package:dartz/dartz.dart';

import '../../../../core/entities/food_post_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/parameters/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

class GetPostByDivision implements UseCase<List<FoodPostModel>, GetPostByDivisionParams> {
  final HomeRepository homeRepository;

  GetPostByDivision({required this.homeRepository});

  @override
  Future<Either<Failure, List<FoodPostModel>>> call(GetPostByDivisionParams params) {
    return homeRepository.getPostByDivision(params);
  }
}

class GetPostByDivisionParams{
  final String division;

  GetPostByDivisionParams(this.division);
}
