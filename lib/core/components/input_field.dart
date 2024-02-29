import 'package:flutter/material.dart';


class InputField extends StatelessWidget {
  final String? labelText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onEditingComplete;
  final AutovalidateMode? autovalidateMode;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autoFocus;
  final bool obscureText;
  const InputField(
      {this.labelText,
        this.onChanged,
        this.onEditingComplete,
        this.validator,
        this.autovalidateMode,
        this.errorText,
        this.keyboardType,
        this.textInputAction,
        this.autoFocus = false,
        this.obscureText = false,
        super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      autofocus: autoFocus,
      onChanged: onChanged,
      onEditingComplete:onEditingComplete ,
      validator: validator,
      autovalidateMode: autovalidateMode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}