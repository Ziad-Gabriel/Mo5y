import 'package:flutter/material.dart';
import 'package:mo5y/features/tasks/widgets/choose_tasks_list.dart';
import 'package:mo5y/features/tasks/widgets/tasks_list/tasks_list.dart';
import 'package:mo5y/features/tasks/widgets/top_task_container.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4),
        TopTaskContainer(),
        SizedBox(height: 16),
        ChooseTasksList(),
        SizedBox(height: 16),
        TasksList(),
      ],
    );
  }
}
