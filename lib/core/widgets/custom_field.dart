import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  String hint;
  Widget? suffixIcon;
  bool? filled;
  Color? fillColor;
  TextEditingController? controller;
  bool obscureText=false ;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  CustomField({
    super.key,
    required this.hint,
    this.suffixIcon,
    this.filled,
    this.fillColor,
    this.controller,
    required this.obscureText,
    this.validator,
    this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            fontSize: 17
          ),
          hintText: hint,
          suffixIcon: suffixIcon,
          filled: filled,
          fillColor: fillColor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  color: Colors.red,
                  width: 2
              )
          )
      ),
      controller: controller,
      obscureText: obscureText,
      validator: validator,
    );
  }
}
