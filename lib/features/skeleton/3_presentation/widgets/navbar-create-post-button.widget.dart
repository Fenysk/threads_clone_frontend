import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/core/utils/modal.util.dart';
import 'package:threads_clone/features/create-post/3_presentation/widget/create-post-modal.widget.dart';

class NavbarCreatePostButtonWidget extends StatefulWidget {
  const NavbarCreatePostButtonWidget({super.key});

  @override
  State<NavbarCreatePostButtonWidget> createState() => _NavbarCreatePostButtonWidgetState();
}

class _NavbarCreatePostButtonWidgetState extends State<NavbarCreatePostButtonWidget> {
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
        onTap: () => ModalUtil().openBottomDrawer(
          context: context,
          child: CreatePostModalWidget(),
        ),
        child: Container(
          width: 48,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TweenAnimationBuilder<Color?>(
            duration: const Duration(milliseconds: 150),
            tween: ColorTween(
              begin: themeData.colorScheme.primary,
              end: _isPressed ? themeData.colorScheme.primary : themeData.scaffoldBackgroundColor,
            ),
            curve: Curves.easeInOut,
            builder: (context, color, _) {
              return Icon(
                FluentIcons.add_16_filled,
                color: color,
              );
            },
          ),
        ),
      ),
    );
  }
}
