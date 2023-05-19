
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class TextFormFieldUtils extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscureText ;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool? isSuffix;
  final TextInputType keyboardType;
  final FormFieldValidator validator;
  const TextFormFieldUtils({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
     this.isSuffix,
     this.obscureText, this.suffixIcon, required this.validator, required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,right: 20,left: 20,bottom: 5),
      child: TextFormField(
        style:  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),
        controller: controller,
        obscureText: obscureText!,
        keyboardType: keyboardType,
        validator: (value) =>
          validator(value)
        ,
        cursorColor: mainColor,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide:  BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.grey.shade50,
          filled: true,
          hintText: hintText,
          contentPadding:
               const EdgeInsets.symmetric(vertical: 20, horizontal: 13),
          hintStyle:  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.grey),
          prefixIcon : prefixIcon ,
          suffixIcon:isSuffix==true? suffixIcon:null,
        ),
      ),
    );
  }
}