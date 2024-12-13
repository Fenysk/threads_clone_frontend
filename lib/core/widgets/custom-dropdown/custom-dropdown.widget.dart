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
    return PopupMenuTheme(
      data: PopupMenuThemeData(
        color: themeData.colorScheme.surface,
        textStyle: themeData.textTheme.bodyMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        labelTextStyle: WidgetStateProperty.all(themeData.textTheme.bodyMedium),
        menuPadding: EdgeInsets.zero,
      ),
      child: PopupMenuButton<String>(
        offset: const Offset(0, 0),
        color: themeData.colorScheme.surface,
        tooltip: "",
        itemBuilder: (BuildContext context) {
          final List<PopupMenuEntry<String>> itemsWithDividers = [];

          for (final item in items) {
            itemsWithDividers.add(item);
            if (item != items.last) {
              const divider = PopupMenuDivider(height: 1);
              itemsWithDividers.add(divider);
            }
          }

          return itemsWithDividers;
        },
        onSelected: onSelected,
        child: Text(
          displayText,
          style: themeData.textTheme.bodySmall?.copyWith(color: Colors.grey),
          softWrap: true,
        ),
      ),
    );
  }
}
