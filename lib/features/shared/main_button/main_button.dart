import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;
  const MainButton({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 80,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withAlpha(150),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: color.withAlpha(150),
              blurRadius: 3,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: color.withAlpha(150),
              blurRadius: 3,
              spreadRadius: 0,
            ),
          ],
          border: Border.all(
            width: 0.5,
            color: Theme.of(context).colorScheme.primary.withAlpha(80),
          ),
        ),
        child: Center(
          child: Text(title, style: Theme.of(context).textTheme.titleSmall),
        ),
      ),
    );
  }
}
