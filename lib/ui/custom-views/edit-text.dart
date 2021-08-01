import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  const EditText({
    Key? key,
    required this.textController,
    this.isPassword = false,
    required this.labelText,
  }) : super(key: key);

  final TextEditingController textController;
  final bool isPassword;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green))),
      obscureText: isPassword,
    );
  }
}
