import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  customTextField(
      {super.key,
      required this.hintText,
      required this.ctrl,
      this.maxline,
      this.icon});
  String hintText;
  TextEditingController ctrl;
  int? maxline;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: TextFormField(
        maxLines: maxline,
        controller: ctrl,
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          hintText: hintText,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF03183D),
              width: 1,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x00000000),
              width: 1,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
