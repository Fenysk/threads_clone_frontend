import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String displayText;
  final List<PopupMenuEntry<String>> items;
  final Function(String) onSelected;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.onSelected,
    required this.displayText,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return PopupMenuButton<String>(
      offset: const Offset(0, 0),
      itemBuilder: (BuildContext context) => items,
      onSelected: onSelected,
      child: Text(
        displayText,
        style: themeData.textTheme.bodySmall?.copyWith(color: Colors.grey),
        softWrap: true,
      ),
    );
  }
}
