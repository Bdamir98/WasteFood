import 'package:dartz/dartz.dart';
import 'package:waste_food_management/src/core/entities/food_post_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/parameters/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

class CreatePost implements UseCase<bool, CreatePostParams> {
  final HomeRepository homeRepository;

  CreatePost({required this.homeRepository});

  @override
  Future<Either<Failure, bool>> call(CreatePostParams params) {
    return homeRepository.createPost(params);
  }
}

class CreatePostParams{
  final FoodPostModel foodPostModel;

  CreatePostParams({required this.foodPostModel});
}
