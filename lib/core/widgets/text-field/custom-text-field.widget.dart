import 'package:flutter/material.dart';

class CustomTextField extends TextField {
  final ThemeData themeData;

  CustomTextField({
    super.key,
    super.controller,
    required this.themeData,
    super.onChanged,
  }) : super(
          style: const TextStyle(fontSize: 16),
          cursorHeight: 16,
          cursorColor: themeData.colorScheme.primary,
          maxLines: null,
          decoration: InputDecoration(
            filled: false,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.zero,
            hintText: 'Quoi de neuf ?',
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: themeData.colorScheme.primary.withOpacity(0.3),
            ),
          ),
        );
}
