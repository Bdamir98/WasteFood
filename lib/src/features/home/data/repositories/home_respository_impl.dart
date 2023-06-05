import 'package:cross_file/src/types/interface.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:waste_food_management/src/core/entities/food_post_model.dart';
import 'package:waste_food_management/src/core/entities/user_model.dart';
import 'package:waste_food_management/src/core/errors/failures.dart';
import 'package:waste_food_management/src/core/parameters/params.dart';
import 'package:waste_food_management/src/features/home/data/datasources/home_remote_data_source.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/create_post.dart';
import '../../domain/usecases/get_post_by_division.dart';
import '../../domain/usecases/upload_image.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, UserModel>> getUserByUid(String uid) async {
    return await _OnBodyCall<UserModel>()(
      () => homeRemoteDataSource.getUserByUid(uid),
    );
  }

  @override
  Future<Either<Failure, bool>> createPost(CreatePostParams params) async {
    return await _OnBodyCall<bool>()(
      () => homeRemoteDataSource.createPost(params.foodPostModel),
    );
  }

  @override
  Future<Either<Failure, List<FoodPostModel>>> getPostByDivision(
      GetPostByDivisionParams params)async{
    return await _OnBodyCall<List<FoodPostModel>>()(
          () => homeRemoteDataSource.getPostByDivision(params.division),
    );
  }

  @override
  Future<Either<Failure, List<FoodPostModel>>> getAllPost() async{
    return await _OnBodyCall<List<FoodPostModel>>()(
          () => homeRemoteDataSource.getAllPost(),
    );
  }

  @override
  Future<Either<Failure, String>> uploadImage(ImageParams params) async {
    return await _OnBodyCall<String>()(
      () => homeRemoteDataSource.uploadImage(params.xFile),
    );
  }
}

class _OnBodyCall<T> {
  Future<Either<Failure, T>> call(Function() callable) async {
    try {
      final remoteData = await callable();
      return right(remoteData);
    } on ServerException catch (e) {
      return left(Failure.serverFailure(failureValue: e.message));
    } catch (e) {
      return left(const Failure.serverFailure(failureValue: 'Server Failure'));
    }
  }
}
