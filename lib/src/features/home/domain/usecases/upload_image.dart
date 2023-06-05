import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waste_food_management/src/core/errors/failures.dart';
import 'package:waste_food_management/src/core/usecases/usecase.dart';
import 'package:waste_food_management/src/features/home/domain/repositories/home_repository.dart';

class UploadImage implements UseCase<String, ImageParams> {
  final HomeRepository homeRepository;

  UploadImage({required this.homeRepository});
  @override
  Future<Either<Failure, String>> call(ImageParams params) async {
    return await homeRepository.uploadImage(params);
  }

}

class ImageParams{
  final XFile xFile;

  ImageParams(this.xFile);
}