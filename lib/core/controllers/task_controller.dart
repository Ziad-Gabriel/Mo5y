import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/models/task_model.dart';
import 'package:mo5y/core/providers/profile_provider.dart';
import 'package:mo5y/core/services/task_service.dart';
import 'package:provider/provider.dart';

class TaskController {
  final Isar isar;
  TaskController(this.isar);

  Future<bool> addTask({
    required String? title,
    required String? description,
    required DateTime? endDate,
    required ProjectModel? project,
    required BuildContext context
  }) async {
    if ((title == null || title.isEmpty) &&
        (description == null || description.isEmpty)) {
      return false;
    }
    if (endDate != null) {
      endDate = DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59);
    }
    TaskModel task = TaskModel()
      ..title = title!
      ..description = description??''
      ..endDate =
          endDate ??
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            23,
            59,
            59,
          ).add(const Duration(days: 1));

    await TaskService(isar).addTask(task: task, project: project,context: context);
    return true;
  }

  Future<void> completeToggle({required int id,required BuildContext context,}) async {
    final task = await TaskService(isar).isar.taskModels.get(id);
    if (task == null) return;
      final updated = TaskModel()
        ..id = task.id
        ..title = task.title
        ..description = task.description
        ..endDate = task.endDate
        ..isCompleted = !task.isCompleted;
      // ignore: use_build_context_synchronously
      await context.read<ProfileProvider>().addCompletedCount(
          isCompleted: updated.isCompleted
        );
      if (updated.isCompleted) {
        updated.completedAt = DateTime.now();
      } else {
        updated.completedAt = null;
      }
    await TaskService(isar).isar.writeTxn(() async {
      await TaskService(isar).isar.taskModels.put(updated);
    });
    
  }

  Future<void> deleteCompletedTasks() async {
    await TaskService(isar).deleteCompletedTasks();
  }
}
