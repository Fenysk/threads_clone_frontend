import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends SearchBar {
  final BuildContext context;

  SearchBarWidget(
    String hintText, {
    super.key,
    required this.context,
  }) : super(
          hintText: hintText,
          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 12)),
          backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.secondary.withAlpha(150)),
          elevation: const WidgetStatePropertyAll(0),
          leading: const Icon(FluentIcons.search_24_filled, color: Colors.grey),
          hintStyle: const WidgetStatePropertyAll(TextStyle(color: Colors.grey)),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
          ),
        );
}
