import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final ValueNotifier<bool>? notifier;
  final ButtonStyle? style;
  final bool? isLoading;
  const AppElevatedButton({
    super.key,
    this.onPressed,
    required this.child,
    this.notifier,
    this.style,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final notifier = this.notifier ?? ValueNotifier(false);
    if (isLoading != null) {
      notifier.value = isLoading!;
    }
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (_, value, __) => ElevatedButton(
        onPressed: onPressed == null
            ? null
            : () {
                if (value) return;
                onPressed?.call();
              },
        style: style,
        child: value ? CupertinoActivityIndicator(color: Colors.black) : child,
      ),
    );
  }
}
