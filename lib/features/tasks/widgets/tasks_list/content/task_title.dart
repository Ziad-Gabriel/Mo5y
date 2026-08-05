import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Finish the project',
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
