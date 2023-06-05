import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordScreen(
  headerBuilder: (context, constraints, shrinkOffset) {
    return Padding(
      padding: const EdgeInsets.all(20).copyWith(top: 40),
      child: Icon(
        Icons.lock,
        color: Colors.blue,
        size: constraints.maxWidth / 4 * (1 - shrinkOffset),
      ),
    );
  },
);
  }
}