import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

enum NavbarButtonType {
  home,
  search,
  activity,
  profile,
}

IconData getIconData({
  required NavbarButtonType type,
  required bool isFilled,
}) =>
    switch (type) {
      NavbarButtonType.home => isFilled ? FluentIcons.home_32_filled : FluentIcons.home_32_regular,
      NavbarButtonType.search => isFilled ? FluentIcons.search_32_filled : FluentIcons.search_32_regular,
      NavbarButtonType.activity => isFilled ? FluentIcons.heart_32_filled : FluentIcons.heart_32_regular,
      NavbarButtonType.profile => isFilled ? FluentIcons.person_32_filled : FluentIcons.person_32_regular,
    };

class NavbarButtonWidget extends StatefulWidget {
  final NavbarButtonType type;
  final bool isActive;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const NavbarButtonWidget({
    super.key,
    required this.type,
    required this.isActive,
    this.onTap,
    this.onLongPress,
  });

  @override
  State<NavbarButtonWidget> createState() => _NavbarButtonWidgetState();
}

class _NavbarButtonWidgetState extends State<NavbarButtonWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: TweenAnimationBuilder<Color?>(
          duration: const Duration(milliseconds: 150),
          tween: ColorTween(
            begin: Colors.grey,
            end: _isPressed || widget.isActive ? themeData.colorScheme.primary : Colors.grey,
          ),
          curve: Curves.easeInOut,
          builder: (context, color, _) {
            return Icon(
              getIconData(
                type: widget.type,
                isFilled: widget.isActive || _isPressed,
              ),
              color: color,
            );
          },
        ),
      ),
    );
  }
}
