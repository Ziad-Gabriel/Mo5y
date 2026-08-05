import 'package:flutter/material.dart';
import 'package:mo5y/features/tasks/widgets/tasks_list/content/task_title.dart';
import 'package:mo5y/features/tasks/widgets/tasks_list/content/task_end_date.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    final List<Color> shadowColors = [
      Theme.of(context).colorScheme.shadow,
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.secondary,
    ];

    return Column(
      spacing: 12,
      children: List.generate(
        3,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 850),
          curve: Curves.easeInOutBack,
          height: 150,
          width: double.infinity,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withAlpha(150),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: isCompleted ? shadowColors[1] : shadowColors[0],
                blurRadius: 10,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: isCompleted ? shadowColors[1] : shadowColors[0],
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: (value) {
                  setState(() {
                    isCompleted = value ?? false;
                  });
                },
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TaskTitle(),
                    const SizedBox(height: 8),
                    TaskEndDate(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
