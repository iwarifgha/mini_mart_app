import 'package:flutter/material.dart';

enum NotificationType { modal, messenger, notification }

//A notifier that leverages on flutter's overlay system to
//display notifications, toasts, or modal dialogs with animations.

class Notifier {
  static OverlayEntry? _overlayEntry;
  static late AnimationController _controller;
  static late Animation<double> _opacityAnimation;
  static late Animation<Offset> _slideAnimation;

  /// Shows an overlay based on the type
  static void showNotifier(
    BuildContext context, {
    required NotificationType type,
    required Widget content,
    Duration duration = const Duration(seconds: 2),
  }) {
    if (_overlayEntry != null) return; // Prevent multiple overlays

    final overlay = Overlay.of(context);

    _controller = AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 800),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: const Offset(0, 0),
    ).animate(_controller);

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return FadeTransition(
          opacity: _opacityAnimation,
          child:
              type == NotificationType.messenger
                  ? SlideTransition(
                    position: _slideAnimation,
                    child: _buildToast(content),
                  )
                  : SlideTransition(
                    position: _slideAnimation,
                    child: _buildNotification(content),
                  ),
        );
      },
    );

    overlay.insert(_overlayEntry!);
    _controller.forward();

    if (type != NotificationType.modal) {
      Future.delayed(duration, () => removeNotifier());
    }
  }

  /// Removes the overlay with animation
  static void removeNotifier() {
    if (_overlayEntry == null) return;

    _controller.reverse().then((_) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  /// Messenger-style overlay (Bottom with slide effect)
  static Widget _buildToast(Widget content) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: 20,
          right: 20,
          child: Material(color: Colors.transparent, child: content),
        ),
      ],
    );
  }

  /// Notification-style overlay (Top with slide effect)
  static Widget _buildNotification(Widget content) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: 50,
          right: 20,
          child: Material(color: Colors.transparent, child: content),
        ),
      ],
    );
  }
}
