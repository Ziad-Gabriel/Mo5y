import 'package:flutter/material.dart';
import 'package:mo5y/core/models/task_model.dart';
import 'package:mo5y/core/providers/tasks_provider.dart';
import 'package:mo5y/features/shared/main_container/main_container.dart';
import 'package:mo5y/features/tasks/widgets/tasks_list/content/task_title.dart';
import 'package:mo5y/features/tasks/widgets/tasks_list/content/task_end_date.dart';
import 'package:provider/provider.dart';

class TasksList extends StatefulWidget {
  final List<TaskModel> taskList;
  const TasksList({super.key, required this.taskList});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    final List<Color> shadowColors = [
      Theme.of(context).colorScheme.shadow,
      Theme.of(context).colorScheme.primary.withAlpha(180),
      Theme.of(context).colorScheme.secondary,
    ];

    return Column(
      spacing: 16,
      children: List.generate(widget.taskList.length, (index) {
        final task = widget.taskList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MainContainer(
            duration: 850,
            curve: Curves.easeInOutBack,
            height: 80,
            width: double.infinity,
            vPadding: 0,
            hPadding: 2,
            color: task.isCompleted ? shadowColors[1] : shadowColors[0],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) {
                    context.read<TasksProvider>().completeToggle(id: task.id);
                  },
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TaskTitle(
                        title: task.title,
                        isCompleted: task.isCompleted,
                      ),
                      const SizedBox(height: 8),
                      TaskEndDate(date: task.endDate),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
