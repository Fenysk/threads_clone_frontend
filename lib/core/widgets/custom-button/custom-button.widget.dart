import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String? text;
  final Widget? icon;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.85).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => _controller.forward(),
        onTapUp: (_) {
          _controller.reverse();
          widget.onPressed();
        },
        onTapCancel: () => _controller.reverse(),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconTheme(
              data: const IconThemeData(
                color: Colors.grey,
                size: 24,
              ),
              child: Row(
                children: [
                  if (widget.text != null)
                    Text(
                      widget.text!,
                      style: themeData.textTheme.labelMedium,
                    ),
                  if (widget.text != null && widget.icon != null) const SizedBox(width: 8),
                  if (widget.icon != null) widget.icon!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
