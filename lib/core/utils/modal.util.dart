import 'package:flutter/material.dart';

class ModalUtil {
  Future<void> openBottomDrawer({
    required BuildContext context,
    required Widget child,
    bool snap = true,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        snap: snap,
        builder: (_, controller) => SingleChildScrollView(
          controller: controller,
          child: child,
        ),
      ),
    );
  }
}
