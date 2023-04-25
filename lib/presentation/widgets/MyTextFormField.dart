import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final bool obscureText;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final IconData icon;
  final String? Function(String?) validate;
  final void Function(String?)? onSave;

  const MyTextFormField(
      {Key? key,
      required this.validate,
      required this.icon,
      required this.controller,
      required this.inputAction,
      required this.inputType,
      required this.name,
      required this.obscureText,
      this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      onSaved: onSave,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF630511), width: 2.0),
        ),
        hintText: name,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            icon,
            color: Colors.black.withOpacity(0.6),
            size: 30,
          ),
        ),
      ),
      keyboardType: inputType,
      textInputAction: inputAction,
    );
  }
}
