import 'package:isar/isar.dart';
import 'package:mo5y/core/models/tasks_stats_model.dart';

class StatsService {
   final Isar isar;
  StatsService(this.isar);

  DateTime _weekStart([DateTime? date]) {
    final d = date ?? DateTime.now();
    final daysSinceSaturday = d.weekday % 7; 
    final start = d.subtract(Duration(days: daysSinceSaturday));
    return DateTime(start.year, start.month, start.day);
  }

  Future<TasksStatsModel> _getOrCreateThisWeek() async {
    final week = _weekStart();
    final existing = await isar.tasksStatsModels
        .filter()
        .weekStartEqualTo(week)
        .findFirst();
    return existing ?? (TasksStatsModel()..weekStart = week);
  }

  Future<void> incrementAdded() async {
    await isar.writeTxn(() async {
      final stats = await _getOrCreateThisWeek();
      stats.tasksAdded += 1;
      await isar.tasksStatsModels.put(stats);
    });
  }

  Future<void> incrementCompleted({required bool undo}) async {
    await isar.writeTxn(() async {
      final stats = await _getOrCreateThisWeek();
      stats.tasksCompleted += undo ? -1 : 1;
      if (stats.tasksCompleted < 0) stats.tasksCompleted = 0;
      await isar.tasksStatsModels.put(stats);
    });
  }

  Stream<List<TasksStatsModel>> watchAllStats() =>
      isar.tasksStatsModels.where().sortByWeekStartDesc().watch(fireImmediately: true);
}