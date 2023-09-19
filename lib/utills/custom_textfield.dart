// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool? enable;
  final TextInputType? textKeyboardType;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final bool obscurText;
  final String? dateMask;
  const CustomTextField({
    Key? key,
    @required this.hintText,
    this.textKeyboardType,
    this.onChanged,
    this.maxLines,
    this.enable,
    this.prefixIcon,
    this.sufixIcon,
    this.obscurText = false,
    @required this.controller,
    this.validator,
    this.dateMask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final dateMaskFormatter = MaskTextInputFormatter(mask: dateMask);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(10), // Set the desired radius value here
          color: Colors.grey.withOpacity(0.1),
        ),
        child: TextFormField(
          style: const TextStyle(color: Colors.black),
          onChanged: onChanged,
          enabled: enable,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          keyboardType: textKeyboardType,
          controller: controller,
          obscureText: obscurText,
          textInputAction: TextInputAction.done,

          // maxLines: maxLines == null ? null : maxLines,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            prefixIcon: prefixIcon,
            suffixIcon: sufixIcon,
            isDense: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
