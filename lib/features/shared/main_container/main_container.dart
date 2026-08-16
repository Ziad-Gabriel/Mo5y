import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final int duration;
  final Curve curve;
  final double? height;
  final double? width;
  final double vPadding;
  final double hPadding;
  final Color color;
  final Widget child;
  const MainContainer({
    super.key,
    required this.duration,
    required this.curve,
    required this.height,
    required this.width,
    required this.vPadding,
    required this.hPadding,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: duration),
      curve: curve,
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surface.withAlpha(150),
        boxShadow: [
          BoxShadow(color: color, blurRadius: 10, spreadRadius: 1),
          BoxShadow(color: color, blurRadius: 10, spreadRadius: 1),
        ],
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withAlpha(80),
        ),
      ),
      child: child,
    );
  }
}
