import 'package:isar/isar.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/models/task_model.dart';

class TaskService {
  final Isar isar;

  TaskService(this.isar);

  Future<void> addTask({
    required TaskModel task,
    ProjectModel? project,
  }) async {
    if (project != null) task.project.value = project;

    await isar.writeTxn(() async {
      await isar.taskModels.put(task);
      if (project != null) await task.project.save();
      return;
    });
  }

  Future<void> updateTask({required TaskModel task}) {
    return isar.writeTxn(() => isar.taskModels.put(task));
  }

  Future<void> deleteTask({required int id}) async {
    await isar.writeTxn(() => isar.taskModels.delete(id));
  }

  Stream<List<TaskModel>> getAllTasks() {
    return isar.taskModels
        .where().watch(fireImmediately: true);
  }
}
