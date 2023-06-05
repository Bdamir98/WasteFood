import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class PhoneVerify extends StatelessWidget {
  const PhoneVerify({Key? key});

  @override
  Widget build(BuildContext context) {
    return PhoneInputScreen(
      // headerBuilder: (context, constraints, shrinkOffset) {
      //   return Padding(
      //     padding: const EdgeInsets.all(10).copyWith(top: 10),
      //     child: Icon(
      //       Icons.phone,
      //       color: Colors.blue,
      //       size: constraints.maxWidth / 4 * (1 - shrinkOffset),
      //     ),
      //   );
      // },
    );
  }
}
