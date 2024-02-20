import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c10_online/my_theme.dart';

// typedef myValidator = String? Function(String?) ;
class CustomTextFormField extends StatelessWidget {
  String label;

  TextInputType keyboardType;

  TextEditingController controller;

  String? Function(String?) validator;

  CustomTextFormField(
      {required this.label,
      required this.controller,
      required this.validator,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyTheme.primaryColor, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyTheme.primaryColor, width: 2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyTheme.redColor, width: 2)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyTheme.redColor, width: 2)),
        ),
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
      ),
    );
  }
}
