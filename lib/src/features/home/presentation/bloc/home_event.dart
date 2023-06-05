part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeInitEvent extends HomeEvent{
  @override
  List<Object?> get props => [];
}

class CheckUserEvent extends HomeEvent{
  @override
  List<Object?> get props => [];
}

class UploadImageEvent extends HomeEvent{
  final XFile xFile;

  const UploadImageEvent({required this.xFile});
  @override
  List<Object?> get props => [xFile];
}

class LogoutEvent extends HomeEvent{

  const LogoutEvent();
  @override
  List<Object?> get props => [];
}

class CreatePostEvent extends HomeEvent{
  final FoodPostModel foodPostModel;
  const CreatePostEvent({required this.foodPostModel});
  @override
  List<Object?> get props => [foodPostModel];
}

class GetAllPostEvent extends HomeEvent{
  const GetAllPostEvent();
  @override
  List<Object?> get props => [];
}

class GetPostByDivisionEvent extends HomeEvent{
  final String division;
  const GetPostByDivisionEvent({required this.division});
  @override
  List<Object?> get props => [division];
}
