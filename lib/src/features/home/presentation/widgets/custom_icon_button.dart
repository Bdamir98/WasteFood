import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const CustomIconButton({
    required this.icon,
    required this.onPressed,
    Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    );
  }
}
