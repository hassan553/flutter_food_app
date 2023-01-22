import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  dynamic keyboard;
  dynamic controller;
  dynamic validator;
  dynamic prefixIcon;
  dynamic suffixIcon;
  dynamic hint;
  dynamic obscure;
  CustomTextField({
    Key? key,
    this.controller,
    this.keyboard,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.hint,
    this.obscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      controller: controller,
      validator: validator,
      obscureText: obscure,
      cursorColor: AppColors.black,
      autofocus: false,
      style: GoogleFonts.tajawal(
          color: AppColors.pink, fontSize: 13, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: GoogleFonts.tajawal(
            color: AppColors.pink, fontSize: 13, fontWeight: FontWeight.bold),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.white)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
