import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pear_monie/utils/colors.dart';
import 'package:pear_monie/utils/dimensions.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final String hintText;
  final TextInputType textInputType;
  final String labelText;
  final String helperText;
  final Color borderColor;
  final Color focusedBorderColor;
  final Function(String text) onChanged;

  const TextFieldInput(
      {required this.hintText,
        this.isPassword = false,
        required this.textEditingController,
        required this.textInputType,required this.labelText,required this.onChanged,
        super.key, required this.borderColor,
        required this.focusedBorderColor, this.helperText = '',});

  @override
  Widget build(BuildContext context) {

    return TextField(
      onChanged:onChanged ,
      style: const TextStyle(color: Colors.white),

      controller: textEditingController,
      decoration: InputDecoration(
        helperStyle: const TextStyle(color: Colors.white),
        helperText: helperText,
        hintStyle: TextStyle(color: Colors.white,fontSize: Dimensions.font14),
        hintText: hintText,

        focusedBorder: OutlineInputBorder(

          borderSide:
          Divider.createBorderSide(context,color: focusedBorderColor),),

labelText: labelText,
        labelStyle: const TextStyle(color: bgColorShadeTextColor,fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context,color: borderColor),),
        //filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
    );
  }
}
