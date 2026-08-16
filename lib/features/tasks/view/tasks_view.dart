import 'package:flutter/material.dart';
import 'package:mo5y/core/providers/tasks_provider.dart';
import 'package:mo5y/features/tasks/widgets/tasks_list/tasks_list.dart';
import 'package:mo5y/features/tasks/widgets/top_task_container.dart';
import 'package:provider/provider.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    final pendingTasks = context.watch<TasksProvider>().getPending;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4),
        TopTaskContainer(
          tasksCount: pendingTasks
              .where((task) => task.isCompleted == false)
              .length,
        ),
        SizedBox(height: 16),
        Text(
          "Tasks will delete after it's day",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: 16),
        Divider(),
        SizedBox(height: 8),
        TasksList(taskList: pendingTasks),
      ],
    );
  }
}
