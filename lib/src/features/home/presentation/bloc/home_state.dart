part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class LoggedInUserState extends HomeState {
  @override
  List<Object> get props => [];
}

class NoLoggedInUserState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeFailureState extends HomeState {
  final String message;

  const HomeFailureState({required this.message});

  @override
  List<Object> get props => [message];
}

class VolunteerUserState extends HomeState {
  const VolunteerUserState();

  @override
  List<Object> get props => [];
}

class DonnerUserState extends HomeState {
  const DonnerUserState();

  @override
  List<Object> get props => [];
}

class ImageUploadLoadingState extends HomeState {
  const ImageUploadLoadingState();

  @override
  List<Object> get props => [];
}

class ImageUploadFailureState extends HomeState {
  final String message;

  const ImageUploadFailureState({required this.message});

  @override
  List<Object> get props => [message];
}

class ImageUploadSuccessState extends HomeState {
  final String downloadLink;

  const ImageUploadSuccessState({required this.downloadLink});

  @override
  List<Object> get props => [downloadLink];
}

class LogoutState extends HomeState {
  const LogoutState();

  @override
  List<Object> get props => [];
}

class FailureState extends HomeState {
  final String message;
  const FailureState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingState extends HomeState {
  const LoadingState();

  @override
  List<Object> get props => [];
}
class CreatePostSuccessState extends HomeState {
  final String message;
  const CreatePostSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}
class GetAllPostState extends HomeState {
  final List<FoodPostModel> allFoodPost;
  const GetAllPostState({required this.allFoodPost});

  @override
  List<Object> get props => [allFoodPost];
}