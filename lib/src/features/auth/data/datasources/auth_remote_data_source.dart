import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:waste_food_management/src/core/entities/address_model.dart';
import 'package:waste_food_management/src/core/entities/user_model.dart';
import 'package:waste_food_management/src/core/errors/exceptions.dart';

import 'package:waste_food_management/src/core/errors/exceptions.dart';
import 'package:waste_food_management/src/core/parameters/params.dart';
import 'package:waste_food_management/src/core/utils/constant.dart';

abstract class AuthRemoteDataSource {
  /// Create new user and store new user data in storage
  /// throws [ServerException] on failed
  Future<UserCredential?> registration(RegistrationParams user);

  /// Login in with email and password
  /// throws [ServerException] on failed
  Future<UserCredential?> loginWithEmailAndPassword(LoginParams params);

  /// Login in with google
  /// throws [ValueException.serverException] on failed
  Future<UserCredential> loginWithGoogle();

  /// Send otp to a number and return vId
  /// throws [ValueException.serverException] on failed
  Future<ConfirmationResult> sendOtp(String phoneNumber);

  /// Send otp to a number and return vId
  /// throws [ValueException.serverException] on failed
  Future<bool> verifyPhoneNumber(ConfirmationResult confirmationResult, String smsCode);

  /// Logout
  /// throws [ValueException.serverException] on failed
  Future<bool> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Future<UserCredential?> loginWithEmailAndPassword(LoginParams user) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }

  @override
  Future<UserCredential> loginWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  @override
  Future<UserCredential?> registration(RegistrationParams user) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    // final useModel = UserModel(
    //   name: user.name,
    //   email: user.email,
    //   image: user.image,
    //   address: user.address,
    //   phone: user.phone,
    //   id: credential.user!.uid,
    //   role: user.role,
    //   password: '',
    //   isApprove: false,
    //   pickedFoods: const [],
    // );
    final addressSaveData =
        await firestore.collection(addressCollectionName).add(user.address.toJson());

    if (addressSaveData.id.isEmpty) {
      await addressSaveData.delete();
      throw const ServerException(message: 'Failed to save document');
    }

    final data = {
      'id': credential.user!.uid,
      'role': user.role,
      'isApprove': false,
      'name': user.name,
      'email': user.email,
      'phone': user.phone,
      'image': user.image,
      'address': addressSaveData.id,
      'pickedFoods': const [],
    };

    final userSavedData = await firestore.collection(userCollectionName).add(data);

    if (userSavedData.id.isEmpty) {
      userSavedData.delete();
      throw const ServerException(message: 'Failed to save document');
    }
    return credential;
  }

  @override
  Future<bool> logout() async {
    bool isLogout = false;
    logger.i('before logout');
    firebaseAuth.signOut().then((value) {
      isLogout = true;
      logger.i('after logout');
    },).onError((error, stackTrace) {
      throw const ValueException.serverException(
          exceptionValue: 'Server not responding');
    });
    return isLogout;
  }

  @override
  Future<ConfirmationResult> sendOtp(String phoneNumber) async{
    logger.e(phoneNumber);

    ConfirmationResult confirmationResult = await firebaseAuth.signInWithPhoneNumber('+44 7123 123 456');
    logger.i(confirmationResult.verificationId);

    // firebaseAuth.verifyPhoneNumber(
    //   timeout: const Duration(seconds: 60),
    //   phoneNumber: phoneNumber,
    //   verificationCompleted: (PhoneAuthCredential credential) {
    //     print('phone number verified');
    //     print('phone number verified: ${credential}');
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     print('verification failed: $e');
    //     throw const ServerException(message:'Verification failed');
    //   },
    //   codeSent: (String verificationId, int? resendToken) {
    //     print('verify id sent: $verificationId');
    //     vId = verificationId;
    //     // vId = verificationId;
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {},
    // );

    return confirmationResult;
  }

  @override
  Future<bool> verifyPhoneNumber(ConfirmationResult confirmationResult, String smsCode) async {

    UserCredential userCredential = await confirmationResult.confirm(smsCode);

    logger.i(userCredential.user);

    if (userCredential.user != null) return true;
    return false;

    // print('verified phone number data source');
    //
    // final PhoneAuthCredential credential =
    // PhoneAuthProvider.credential(verificationId: vId, smsCode: smsCode);
    //
    // print('credential have: $credential');
    //
    // UserCredential userCredential =
    //     await firebaseAuth.signInWithCredential(credential);
    //
    // print('credential have: $credential');
    // print('user credential have: $userCredential');
    //
    //
    //
    // if (userCredential.user != null) {
    //   // await firebaseAuth.currentUser?.delete();
    //   return true;
    // }
    //
    // return false;
  }
}
