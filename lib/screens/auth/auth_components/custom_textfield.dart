import 'package:flutter/material.dart';

import 'package:instaclon/screens/constants/size.dart';
import 'package:instaclon/utils/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorText = '',
    this.padding = EdgeInsets.zero,
    this.prefixIcon,
  });
  final TextEditingController controller;
  final String hintText;
  final String errorText;
  final EdgeInsets padding;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: Sizes.defaultLabeltSize),
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            errorText: errorText,
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.defaultBorderRadius),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            fillColor: AppColors.textfieldColor,
            filled: true),
      ),
    );
  }
}
