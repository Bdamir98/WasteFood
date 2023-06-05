import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waste_food_management/src/core/entities/food_post_model.dart';
import 'package:waste_food_management/src/core/entities/user_model.dart';
import 'package:waste_food_management/src/core/parameters/params.dart';
import 'package:waste_food_management/src/core/usecases/usecase.dart';
import 'package:waste_food_management/src/features/home/domain/usecases/create_post.dart';
import 'package:waste_food_management/src/features/home/domain/usecases/get_all_post.dart';
import 'package:waste_food_management/src/features/home/domain/usecases/get_post_by_division.dart';
import 'package:waste_food_management/src/features/home/domain/usecases/get_user_by_uid.dart';
import 'package:waste_food_management/src/features/home/domain/usecases/upload_image.dart';

import '../../../../core/static_db.dart';
import '../../../../injection/injection_container.dart';
import '../../../auth/domain/usecases/logout.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserByUid getUserByUid;
  final GetAllPost getAllPost;
  final GetPostByDivision getPostByDivision;
  final CreatePost createPost;
  final Logout logout;
  final UploadImage uploadImage;

  final firebaseAuth = sl<FirebaseAuth>();
  List<FoodPostModel> allPosts = [];

  HomeBloc({
    required this.getUserByUid,
    required this.logout,
    required this.getAllPost,
    required this.getPostByDivision,
    required this.createPost,
    required this.uploadImage,
  }) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      emit(const LoadingState());
      if (firebaseAuth.currentUser != null) {
        var response = await getUserByUid(firebaseAuth.currentUser!.uid);
        await response.fold(
          (l) async {
            emit(HomeFailureState(message: l.failureValue));
          },
          (r) async {
            currentUser = r;
            emit(LoggedInUserState());
          },
        );
      }
    });

    on<CheckUserEvent>((event, emit) {

      if (currentUser?.role == 'Volunteer') {
        emit(const VolunteerUserState());
        return;
      }
      if (currentUser?.role == "Donner") {
        emit(const DonnerUserState());
      }
    });

    on<UploadImageEvent>((event, emit) async {
      emit(const ImageUploadLoadingState());
      var response = await uploadImage(ImageParams(event.xFile));

      await response.fold(
        (l) async {
          emit(ImageUploadFailureState(message: l.failureValue));
        },
        (r) async {
          emit(ImageUploadSuccessState(downloadLink: r));
        },
      );
    });

    on<LogoutEvent>((event, emit) async {
      emit(const LoadingState());
      var response = await logout(NoParams());
      await response.fold(
        (l) async {
          emit(HomeFailureState(message: l.failureValue));
        },
        (r) async {
          currentUser = null;
          emit(const LogoutState());
        },
      );
    });

    on<CreatePostEvent>((event, emit) async {
      emit(const LoadingState());

      var response = await createPost(
        CreatePostParams(foodPostModel: event.foodPostModel),
      );

      await response.fold(
        (l) async {
          emit(FailureState(message: l.failureValue));
        },
        (r) async {
          if (r) {
            emit(const CreatePostSuccessState(message: 'New Post Created'));

            return;
          }
          emit(const FailureState(message: 'Post create failed'));
        },
      );
    });

    on<GetAllPostEvent>((event, emit) async {
      emit(const LoadingState());

      var response = await getAllPost(NoParams());

      await response.fold(
        (l) async {
          emit(FailureState(message: l.failureValue));
        },
        (r) async {
          allPosts = r;
          if (r.isEmpty){
            emit(const FailureState(message: 'Food count zero'));
          }

          emit(GetAllPostState(allFoodPost: r));
        },
      );
    });
    
    on<GetPostByDivisionEvent>((event, emit) async {
      emit(const LoadingState());

      var response = await getPostByDivision(GetPostByDivisionParams(event.division));

      await response.fold(
        (l) async {
          emit(FailureState(message: l.failureValue));
        },
        (r) async {
          allPosts = r;
          if (r.isEmpty){
            emit(const FailureState(message: 'Food count zero'));
          }

          emit(GetAllPostState(allFoodPost: r));
        },
      );
    });
  }
}
