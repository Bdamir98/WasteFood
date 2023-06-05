import 'package:waste_food_management/src/features/home/data/datasources/home_remote_data_source.dart';
import 'package:waste_food_management/src/features/home/data/repositories/home_respository_impl.dart';
import 'package:waste_food_management/src/features/home/domain/repositories/home_repository.dart';
import 'package:waste_food_management/src/features/home/domain/usecases/create_post.dart';
import 'package:waste_food_management/src/features/home/domain/usecases/get_all_post.dart';
import 'package:waste_food_management/src/features/home/domain/usecases/get_post_by_division.dart';
import 'package:waste_food_management/src/features/home/domain/usecases/get_user_by_uid.dart';
import 'package:waste_food_management/src/features/home/domain/usecases/upload_image.dart';
import 'package:waste_food_management/src/features/home/presentation/bloc/home_bloc.dart';

import 'injection_container.dart';

void initHome() {
  // Bloc
  sl.registerFactory(
    () => HomeBloc(
      getUserByUid: sl(),
      logout: sl(),
      getAllPost: sl(),
      getPostByDivision: sl(),
      createPost: sl(),
      uploadImage: sl(),
    ),
  );

  // Usecases
  sl.registerLazySingleton(
    () => GetUserByUid(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetAllPost(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetPostByDivision(
      homeRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => CreatePost(
      homeRepository: sl(),
    ),
  );
  
  sl.registerLazySingleton(
    () => UploadImage(
      homeRepository: sl(),
    ),
  );

  // Repositories
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      homeRemoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      firestore: sl(), firebaseStorage: sl(),
    ),
  );
}
