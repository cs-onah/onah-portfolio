import 'package:flutter/material.dart';

class BounceAnimation extends StatefulWidget {
  final Widget child;
  const BounceAnimation({super.key, required this.child});
  @override
  BounceAnimationState createState() => BounceAnimationState();
}

class BounceAnimationState extends State<BounceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // Repeats the animation

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Smooth bounce effect
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -20 * _animation.value), // Moves up & down
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
