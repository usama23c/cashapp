import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.label = '',
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          // labelText: label.isNotEmpty ? label : null,
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey, fontSize: 15.sp, fontWeight: FontWeight.w700),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.w),
            borderSide: BorderSide(color: Color(0xffcfdede), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.w),
            borderSide: BorderSide(color: Color(0xffcfdede), width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        ),
      ),
    );
  }
}
