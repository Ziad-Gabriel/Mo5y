import 'package:isar/isar.dart';
import 'package:mo5y/core/models/profile_model.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/models/task_model.dart';

class TaskService {
  final Isar isar;

  TaskService(this.isar);

  Future<void> addTask({
    required TaskModel task,
    required ProfileModel profile,
    ProjectModel? project,
  }) async {
    task.profile.value = profile;
    if (project != null) task.project.value = project;

    await isar.writeTxn(() async {
      await isar.taskModels.put(task);
      await task.profile.save();
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

  Stream<List<TaskModel>> getAllTasks({required int profileId}) {
    return isar.taskModels
        .filter()
        .profile((q) => q.idEqualTo(profileId))
        .watch(fireImmediately: true);
  }
}
