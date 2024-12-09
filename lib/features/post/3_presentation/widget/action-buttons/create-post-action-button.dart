import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/core/widgets/custom-button/custom-button.widget.dart';

enum ActionButtonType {
  medias,
  camera,
  gif,
  hashtag,
}

class CreatePostActionButton extends StatefulWidget {
  final VoidCallback onPressed;
  final ActionButtonType type;

  const CreatePostActionButton({
    super.key,
    required this.onPressed,
    required this.type,
  });

  @override
  State<CreatePostActionButton> createState() => _CreatePostActionButtonState();
}

class _CreatePostActionButtonState extends State<CreatePostActionButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget get icon => switch (widget.type) {
        ActionButtonType.medias => const Icon(FluentIcons.image_multiple_24_regular),
        ActionButtonType.camera => const Icon(FluentIcons.camera_24_regular),
        ActionButtonType.gif => const Icon(FluentIcons.gif_24_regular),
        ActionButtonType.hashtag => const Icon(FluentIcons.number_symbol_24_regular),
      };

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {},
      icon: icon,
    );
  }
}
