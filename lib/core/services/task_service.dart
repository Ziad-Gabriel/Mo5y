import 'package:isar/isar.dart';
import 'package:mo5y/core/models/project_model.dart';
import 'package:mo5y/core/models/task_model.dart';
import 'package:mo5y/core/services/stats_service.dart';

class TaskService {
  final Isar isar;

  TaskService(this.isar);

  Future<void> addTask({required TaskModel task, ProjectModel? project}) async {
    if (project != null) task.project.value = project;

      await StatsService(isar).incrementAdded();
    await isar.writeTxn(() async {
      await isar.taskModels.put(task);
      if (project != null) {
        await task.project.save();
        project.tasks.add(task);
        await project.tasks.save();
      }
      return;
    });
  }

  Future<void> deleteCompletedTasks() async {
    await isar.writeTxn(() async {
      final willBeDeleted = await isar.taskModels
          .where()
          .filter()
          .endDateLessThan(
            DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              0,
              0,
            ),
          )
          .findAll();
      final ids = willBeDeleted.map((t) => t.id).toList();
      await isar.taskModels.deleteAll(ids);
    });
  }

  Stream<List<TaskModel>> getAllTasks() {
    return isar.taskModels.where().watch(fireImmediately: true);
  }
}
