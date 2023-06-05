import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../bloc/auth_bloc.dart';

Future<bool> showOtpDialog(BuildContext context, ConfirmationResult confirmationResult) async{
  final codeController = TextEditingController();
  bool isVerified = false;

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.all(8),
      content: BlocConsumer<AuthBloc, AuthState>(
        bloc: context.read<AuthBloc>(),
        listener: (context, state) {
          print('listener ata otp content');

          if (state is RegistrationFailedState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }

          if (state is VerifiedPhoneNumberState){
            print('Verified phone');
            isVerified = state.isVerified;
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return PinCodeTextField(
            appContext: context,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,

            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(30),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
            ),
            animationDuration: const Duration(milliseconds: 300),
            // backgroundColor: Colors.blue.shade50,
            // enableActiveFill: true,
            //errorAnimationController: errorController,
            controller: codeController,
            onCompleted: (v) async {
              print('code: ${codeController.text}');
              context.read<AuthBloc>().add(
                    VerifyPhoneEvent(
                      confirmationResult: confirmationResult,
                      smsCode: codeController.text,
                    ),
                  );

              // print("Completed");
              // try {
              //   bool otpVerified =
              //       await provider.matchingSmsCode(vId, codeController.text);
              //   print('otp verified: $otpVerified');
              //   if (otpVerified) {
              //     // await authProvider.deleteUser();
              //     bool isAuth = await provider.authenticate(isSignUp: true);
              //     print('auth: $isAuth');
              //     if (isAuth) {
              //       // if (await provider.emailVerification()){
              //       try {
              //         await provider.storeInDataBase();
              //         context.read<DistrictsProvider>().reset();
              //         print('stored db');
              //         Navigator.pushNamedAndRemoveUntil(
              //             context, LauncherPage.routeName, (route) => false);
              //       } catch (e) {
              //         showMsg(context, e.toString());
              //         Navigator.pop(context);
              //         Navigator.pop(context);
              //       }
              //
              //       // }
              //     }
              //   } else {
              //     Navigator.pop(context);
              //     showMsg(context, 'Wrong OTP');
              //   }
              // } catch (error) {
              //   print('otpDialog error: $error');
              //   Navigator.pop(context);
              // }
            },
            onChanged: (value) {
              print('onchanged: $value');
            },
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          );
        },
      ),
    ),
  );

  return isVerified;
}
