import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  final String title;
  final bool isCompleted;
  const TaskTitle({super.key, required this.title, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: isCompleted
          ? Theme.of(context).textTheme.bodyLarge?.copyWith(
              decoration: TextDecoration.lineThrough,
              color: Theme.of(
                context,
              ).textTheme.bodyLarge?.color?.withAlpha(150),
            )
          : Theme.of(context).textTheme.bodyLarge,
    );
  }
}
