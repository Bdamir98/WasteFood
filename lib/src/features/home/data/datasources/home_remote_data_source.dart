import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waste_food_management/src/core/entities/address_model.dart';
import 'package:waste_food_management/src/core/entities/food_post_model.dart';
import 'package:waste_food_management/src/core/entities/food_post_model.dart';
import 'package:waste_food_management/src/core/entities/food_post_model.dart';
import 'package:waste_food_management/src/core/entities/user_model.dart';
import 'package:waste_food_management/src/core/errors/exceptions.dart';
import 'package:waste_food_management/src/core/parameters/params.dart';
import 'package:waste_food_management/src/core/static_db.dart';
import 'package:waste_food_management/src/core/utils/constant.dart';

abstract class HomeRemoteDataSource {
  /// Fetch all post
  /// throw [ValueException.serverException]
  Future<UserModel?> getUserByUid(String uid);

  /// Fetch all post
  /// throw [ValueException.serverException]
  Future<List<FoodPostModel>> getAllPost();

  /// Create new post
  /// throw [ValueException.serverException]
  Future<bool> createPost(FoodPostModel foodPostModel);

  /// Fetch posts by division
  /// throw [ValueException.serverException]
  Future<List<FoodPostModel>> getPostByDivision(String divisionName);

  /// Fetch posts by division
  /// throw [ValueException.serverException]
  Future<String> uploadImage(XFile xFile);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseStorage firebaseStorage;

  HomeRemoteDataSourceImpl(
      {required this.firestore, required this.firebaseStorage});

  @override
  Future<UserModel?> getUserByUid(String uid) async {
    UserModel? userModel;

    final user = await firestore
        .collection(userCollectionName)
        .where('id', isEqualTo: uid)
        .get();

    final userJson = user.docs.first.data();

    final userAddress = await firestore
        .collection(addressCollectionName)
        .doc(user.docs.first.data()['address'])
        .get();

    userJson['address'] = userAddress.data();

    userModel = UserModel.fromJson(userJson);

    return userModel;
  }

  @override
  Future<bool> createPost(FoodPostModel foodPostModel) async {
    foodPostModel.date = DateTime.now().millisecondsSinceEpoch;
    foodPostModel.id = currentUser!.id;

    final postFood = await firestore
        .collection(postCollectionName)
        .add(foodPostModel.toJson());

    if (postFood.id.isEmpty) {
      throw const ServerException(message: 'Failed to save post');
    }
   await firestore
        .collection(postCollectionName).doc(postFood.id).update({
          'postId':postFood.id
        });
    return true;
  }

  @override
  Future<List<FoodPostModel>> getAllPost() async {
    final querySnapshot = await firestore
        .collection(postCollectionName)
        .orderBy('date', descending: true)
        .get();
    List<FoodPostModel> allFoodPost = [];
    allFoodPost = List.generate(querySnapshot.docs.length,
        (index) => FoodPostModel.fromJson(querySnapshot.docs[index]));

    //  allPostStream.listen((QuerySnapshot<Map<String, dynamic>> snapshot) {
    //   List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = snapshot.docs;
    //   // Use the 'documents' list here
    //   documents.forEach((QueryDocumentSnapshot<Map<String, dynamic>> document) {
    //     Map<String, dynamic> data = document.data();
    //     // Use the 'data' map for each document here
    //     allFoodPost.add(FoodPostModel.fromJson(data));
    //   });
    //
    // });


    return allFoodPost;
  }

  @override
  Future<List<FoodPostModel>> getPostByDivision(String divisionName) async {
    final querySnapshot = await firestore
        .collection(postCollectionName)
        .where('division', isEqualTo: divisionName)
        .get();


    List<FoodPostModel> allFoodPost = [];
    allFoodPost = List.generate(querySnapshot.docs.length,
            (index) => FoodPostModel.fromJson(querySnapshot.docs[index]));



    //  allPostStream.listen((QuerySnapshot<Map<String, dynamic>> snapshot) {
    //   List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = snapshot.docs;
    //   // Use the 'documents' list here
    //   documents.forEach((QueryDocumentSnapshot<Map<String, dynamic>> document) {
    //     Map<String, dynamic> data = document.data();
    //     // Use the 'data' map for each document here
    //     allFoodPost.add(FoodPostModel.fromJson(data));
    //   });
    //
    // });


    return allFoodPost;
  }

  @override
  Future<String> uploadImage(XFile xFile) async {
    final imageName = DateTime.now().microsecondsSinceEpoch.toString();

    final Reference storageRef = firebaseStorage
        .ref()
        .child('picture/$imageName'); // Set the storage path for your images

    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final UploadTask uploadTask =
        storageRef.putData(await xFile.readAsBytes(), metaData);

    final storageSnapshot = await uploadTask.whenComplete(() => null);
    final String downloadUrl = await storageSnapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}
