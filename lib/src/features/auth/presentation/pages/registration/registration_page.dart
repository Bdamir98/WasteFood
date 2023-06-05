import 'package:flutter/material.dart';

import '../../screens/registration_screen/registration_screen.dart';

class RegistrationPage extends StatelessWidget {
  static const String routeName = '/registration';
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: RegistrationScreen(),
    );
  }
}
