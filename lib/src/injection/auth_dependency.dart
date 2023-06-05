import '../features/auth/data/datasources/auth_remote_data_source.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/login_with_email_and_password.dart';
import '../features/auth/domain/usecases/login_with_google.dart';
import '../features/auth/domain/usecases/logout.dart';
import '../features/auth/domain/usecases/registration.dart';
import '../features/auth/domain/usecases/send_otp.dart';
import '../features/auth/domain/usecases/verifi_phone_number.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import 'injection_container.dart';

void initAuth() {
  // Bloc
  sl.registerFactory(
    () => AuthBloc(
      registration: sl(),
      loginWithEmailAndPassword: sl(),
      // logout: sl(),
      sendOtp: sl(),
      verifyPhoneNumber: sl(),
    ),
  );

  // Usecases
  sl.registerLazySingleton(
    () => Registration(
      authRepository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => SendOtp(
      authRepository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => VerifyPhoneNumber(
      authRepository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => LoginWithEmailAndPassword(
      authRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => LoginWithGoogle(
      authRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => Logout(
      authRepository: sl(),
    ),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: sl(),
      firestore: sl(),
    ),
  );
}
