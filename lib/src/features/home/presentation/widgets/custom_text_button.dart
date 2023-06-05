import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomTextButton({
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
      child: Text(title),
    );
  }
}
