import 'package:flutter/material.dart';
import 'package:mo5y/core/utils/date_formatter.dart';

class TaskEndDate extends StatelessWidget {
  final DateTime date;
  const TaskEndDate({super.key,required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.watch_later_outlined,
          size: 16,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 4),
        Text(
          customDateFormatter(date: date),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
