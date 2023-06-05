import 'package:dartz/dartz.dart';
import 'package:waste_food_management/src/core/entities/user_model.dart';

import '../../../../core/entities/food_post_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/parameters/params.dart';
import '../usecases/create_post.dart';
import '../usecases/get_post_by_division.dart';
import '../usecases/upload_image.dart';


abstract class HomeRepository {
  Future<Either<Failure, UserModel>> getUserByUid(String uid);

  Future<Either<Failure, List<FoodPostModel>>> getAllPost();

  Future<Either<Failure, bool>> createPost(CreatePostParams params);

  Future<Either<Failure, String>> uploadImage(ImageParams params);

  Future<Either<Failure, List<FoodPostModel>>> getPostByDivision(GetPostByDivisionParams params);

}
