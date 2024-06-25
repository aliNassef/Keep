import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    super.key,
    required this.hint,
    this.maxLines,
    this.initialValue,
    this.controller,
    this.onSaved,
    this.onChanged,
    this.validator,
  });
  final String hint;
  final int? maxLines;
  final String? initialValue;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: Theme.of(context).textTheme.bodySmall,
      cursorColor: Colors.grey,
      onSaved: onSaved,
      onChanged: onChanged,
      initialValue: initialValue,
      maxLines: maxLines,
      autocorrect: true,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppStyles.textStyle30,
        border: InputBorder.none,
      ),
    );
  }
}
