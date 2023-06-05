import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:waste_food_management/src/injection/auth_dependency.dart';
import 'package:waste_food_management/src/injection/home_dependency.dart';


final sl = GetIt.instance;

void initInjection() {
  initHome();
  initAuth();

  // Core

  // External
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => FirebaseStorage.instance);
}
