import 'package:isar/isar.dart';

part 'tasks_stats_model.g.dart';

@collection
class TasksStatsModel {
  Id id = Isar.autoIncrement;

  late DateTime weekStart; 

  int tasksAdded = 0;
  int tasksCompleted = 0;
}